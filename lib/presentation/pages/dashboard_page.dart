import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gallery_app/presentation/viewmodels/photo_view_model.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 96,
        leading: Row(
          children: [
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.black,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('A', style: TextStyle(color: Colors.white, fontSize: 10, height: 1.0)),
                  Text('G', style: TextStyle(color: Colors.white, fontSize: 10, height: 1.0)),
                  Text('C', style: TextStyle(color: Colors.white, fontSize: 10, height: 1.0)),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Text('AGC', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFFE0003C),
              child: const Icon(Icons.person, color: Colors.white, size: 18),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
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
                  const Icon(Icons.upload_outlined, size: 30, color: Colors.black87),
                  const SizedBox(height: 4),
                  const Text('Upload', style: TextStyle(color: Color(0xFF5E7BB5), fontSize: 14)),
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
                  const Icon(Icons.edit_outlined, size: 30, color: Colors.black87),
                  const SizedBox(height: 4),
                  const Text('Edit', style: TextStyle(color: Color(0xFF5E7BB5), fontSize: 14)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Username
          const Text(
            'john.doe',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, letterSpacing: 0.2),
          ),
          const SizedBox(height: 8),
          
          // My dashboard row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My dashboard', style: TextStyle(color: Colors.black87, fontSize: 14)),
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
          
          // Likes row (pixel-tuned)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border, color: Colors.red, size: 20),
              const SizedBox(width: 6),
              const Text('120', style: TextStyle(color: Colors.black87, fontSize: 14)),
              const SizedBox(width: 24),
              const Icon(Icons.send_rounded, color: Color(0xFF5E7BB5), size: 20),
              const SizedBox(width: 6),
              const Text('43K', style: TextStyle(color: Colors.black87, fontSize: 14)),
              const SizedBox(width: 24),
              const Icon(Icons.share_outlined, color: Colors.black54, size: 20),
              const SizedBox(width: 6),
              const Text('2.3K', style: TextStyle(color: Colors.black87, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          
          // Color palette
           Row(
             children: [
               const Expanded(
                 child: ColorPalette(
                   label: 'palette',
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
      child: Consumer<PhotoViewModel>(
        builder: (context, vm, _) {
          if ((vm.status == PhotoVmStatus.initial || vm.status == PhotoVmStatus.loading) && vm.photos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (vm.status == PhotoVmStatus.error) {
            return Center(child: Text('Error: ${vm.errorMessage}'));
          } else if (vm.photos.isEmpty) {
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
            itemCount: vm.photos.length,
            itemBuilder: (context, index) {
              final photo = vm.photos[index];
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