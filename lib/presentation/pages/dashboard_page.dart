import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/presentation/blocs/photo/photo_bloc.dart';
import 'package:flutter_gallery_app/presentation/blocs/photo/photo_event.dart';
import 'package:flutter_gallery_app/presentation/blocs/photo/photo_state.dart';
import 'package:flutter_gallery_app/presentation/widgets/color_palette.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  
  @override
  void initState() {
    super.initState();
    context.read<PhotoBloc>().add(const FetchPhotos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            child: const Text('AGC', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Color(0xFFE91E63),
              child: Icon(Icons.notifications, color: Colors.white, size: 16),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(),
            _buildNavigationSection(),
            _buildGalleryGrid(),
          ],
        ),
      ),
    );
  }
  
  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          // Profile image and edit buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Icon(Icons.upload_outlined, size: 30),
                  const SizedBox(height: 4),
                  Text('Upload', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/avatter.jpeg'),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.edit_outlined, size: 30),
                  const SizedBox(height: 4),
                  Text('Edit', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Username
          const Text(
            'john.doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          
          // My dashboard row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My dashboard', style: TextStyle(color: Colors.grey[600])),
              const SizedBox(width: 8),
              Switch(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatColumn('2.3K', 'Followers'),
              _buildStatColumn('50', 'Artworks'),
              _buildStatColumn('21', 'Exhibitions'),
            ],
          ),
          const SizedBox(height: 16),
          
          // Likes row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border, color: Colors.red),
              const SizedBox(width: 4),
              Text('120', style: TextStyle(color: Colors.grey[600])),
              const SizedBox(width: 16),
              const Icon(Icons.remove_red_eye_outlined, color: Colors.grey),
              const SizedBox(width: 4),
              Text('4.3K', style: TextStyle(color: Colors.grey[600])),
              const SizedBox(width: 16),
              const Icon(Icons.share_outlined, color: Colors.grey),
              const SizedBox(width: 4),
              Text('2.3K', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          const SizedBox(height: 16),
          
          // Color palette
           Row(
             children: [
               Text('palette', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
               const SizedBox(width: 8),
               const Expanded(
                 child: ColorPalette(
                   colors: [
                     Color(0xFF4A1E5F),  // Purple
                     Color(0xFFE91E63),  // Pink
                     Color(0xFFF44336),  // Red
                     Color(0xFFFF9800),  // Orange
                     Color(0xFFFFEB3B),  // Yellow
                   ],
                 ),
               ),
             ],
           ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
  
  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
      ],
    );
  }
  
  Widget _buildNavigationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.upload_outlined, 'Uploads', 0),
          _buildNavItem(Icons.image_outlined, 'Exhibitions', 1),
          _buildNavItem(Icons.attach_money_outlined, 'Revenue', 2),
        ],
      ),
    );
  }
  
  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        children: [
          Icon(
            icon,
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2,
            width: 40,
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent,
          ),
        ],
      ),
    );
  }
  
  Widget _buildGalleryGrid() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if ((state.status == PhotoStatus.initial || state.status == PhotoStatus.loading) && state.photos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == PhotoStatus.error) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state.photos.isEmpty) {
            return const Center(child: Text('No photos available'));
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: state.photos.length,
            itemBuilder: (context, index) {
              final photo = state.photos[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://picsum.photos/id/${photo.id}/300/300',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
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
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}