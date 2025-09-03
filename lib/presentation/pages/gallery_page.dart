import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/domain/entities/photo.dart';
import 'package:flutter_gallery_app/presentation/blocs/photo/photo_bloc.dart';
import 'package:flutter_gallery_app/presentation/blocs/photo/photo_event.dart';
import 'package:flutter_gallery_app/presentation/blocs/photo/photo_state.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<PhotoBloc>().add(const FetchPhotos());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PhotoBloc>().add(const FetchMorePhotos());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<PhotoBloc>().add(const RefreshPhotos());
            },
          ),
        ],
      ),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          switch (state.status) {
            case PhotoStatus.initial:
              return const Center(child: Text('No photos yet'));
            case PhotoStatus.loading:
              if (state.photos.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return _buildPhotoGrid(state.photos, true);
            case PhotoStatus.loaded:
              if (state.photos.isEmpty) {
                return const Center(child: Text('No photos available'));
              }
              return _buildPhotoGrid(state.photos, false);
            case PhotoStatus.error:
              return Center(child: Text('Error: ${state.errorMessage}'));
          }
        },
      ),
    );
  }

  Widget _buildPhotoGrid(List<Photo> photos, bool isLoading) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<PhotoBloc>().add(const RefreshPhotos());
      },
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return _buildPhotoItem(photo);
              },
            ),
          ),
          if (isLoading || !context.read<PhotoBloc>().state.hasReachedMax)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPhotoItem(Photo photo) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: photo.url,
            placeholder: (context, url) => AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.grey[300],
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
            errorWidget: (context, url, error) => AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.grey[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.broken_image, size: 48, color: Colors.grey),
                    SizedBox(height: 8),
                    Text(
                      'Image link is not valid',
                      style: TextStyle(color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              photo.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}