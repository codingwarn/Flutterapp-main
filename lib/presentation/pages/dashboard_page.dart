import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gallery_app/presentation/viewmodels/photo_view_model.dart';
import 'package:flutter_gallery_app/presentation/widgets/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

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
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.only(top: 27),
          child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 24),
            SizedBox(
              width: 28,
              height: 28,
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Color(0xFF231F20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('A', style: TextStyle(color: Colors.white, fontSize: 9, height: 1.0, fontWeight: FontWeight.w500)),
                    Text('G', style: TextStyle(color: Colors.white, fontSize: 9, height: 1.0, fontWeight: FontWeight.w500)),
                    Text('C', style: TextStyle(color: Colors.white, fontSize: 9, height: 1.0, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: 52.76,
              height: 14.9,
              child: Center(
                child: Text(
                  'AGC',
                  style: GoogleFonts.barlow(
                    color: Color(0xFF000000),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 14.9 / 15,
                    letterSpacing: 0,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  softWrap: false,
                ),
              ),
            ),
          ],
        ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: SizedBox(
              width: 33,
              height: 33,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Solid circular background to match Figma 33x33
                  Container(
                    width: 33,
                    height: 33,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD1163A),
                      shape: BoxShape.circle,
                    ),
                  ),
                  // Centered person glyph sized exactly 17.98 x 19
                  SizedBox(
                    width: 17.98,
                    height: 19,
                    child: const CustomPaint(
                      painter: _PersonGlyphPainter(color: Colors.white),
                    ),
                  ),
                ],
              ),
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
                  Image.asset(
                    'assets/images/image.png',
                    width: 27.97,
                    height: 32.39,
                  ),
                  const SizedBox(height: 4),
                  const Text('Upload', style: TextStyle(color: Color(0xFF5E7BB5), fontSize: 14)),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: const [
                  CircleAvatar(
                    radius: 63.5, // 127 x 127 diameter
                    backgroundImage: AssetImage('assets/images/avatter.jpeg'),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
              Column(
                children: [
                     Image.asset(
                    'assets/images/edit.png',
                    width: 26.99,
                    height: 26.99,
                  ),
                  const SizedBox(height: 4),
                  const Text('Edit', style: TextStyle(color: Color(0xFF5E7BB5), fontSize: 14)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Username
          SizedBox(
            width: 267,
            height: 28,
            child: Center(
              child: Text(
                'john.doe',
                textAlign: TextAlign.center,
                style: GoogleFonts.barlow(
                  fontSize: 36,
                  // Closest to Figma ExtraLight (275)
                  fontWeight: FontWeight.w600,
                  height: 28 / 36,
                  letterSpacing: -1.32,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          
          // My dashboard row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 65,
                height: 24,
                child: Center(
                  child: Text(
                    'My dashboard',
                    style: GoogleFonts.barlowCondensed(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      height: 24 / 14, // line height
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: 46,
                height: 17,
                child: Center(
                  child: Transform.scale(
                    scale: 17 / 28, // 28 is the default height of a Flutter Switch
                    child: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: Colors.green,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 2,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFDBDBD8)),
              ),
            ),
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
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 2,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFDBDBD8)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Likes row (pixel-tuned)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Image.asset(
                'assets/images/heart.png',
                width: 19,
                height: 16, 
                color: Color(0xFFFF0000),

              ),
             const SizedBox(width: 6),
            
              const Text('120', style: TextStyle(color: Colors.black87, fontSize: 14)),
              const SizedBox(width: 24),
                 Image.asset(
                'assets/images/share.png',
                width: 16,
                height: 16,
                color: Color(0xFF007DB2),
              ),
              const SizedBox(width: 6),
              const Text('43K', style: TextStyle(color: Colors.black87, fontSize: 14)),
              const SizedBox(width: 24),
               Image.asset(
                'assets/images/shareeee.png',
                width: 14,
                height: 16,
                color: Color(0xFF000000),
              ),
           
              const SizedBox(width: 6),
              const Text('2.3K', style: TextStyle(color: Colors.black87, fontSize: 14)),
              const SizedBox(width: 24),
             
            ],
          ),
          const SizedBox(height: 16),
          
          // Color palette
           Row(
             children: [
               const Expanded(
                 child: ColorPalette(
                   label: 'pallette',
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
        SizedBox(
          width: 75,
          height: 29,
          child: Center(
            child: Text(
              count,
              textAlign: TextAlign.center,
              style: GoogleFonts.barlowCondensed(
                fontSize: 24,
                fontWeight: FontWeight.w300,
                height: 29 / 24,
                letterSpacing: 0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 80,
          height: 24,
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.barlow(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 24 / 14,
                letterSpacing: 0,
                color: Colors.black87,
              ),
            ),
          ),
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
          _buildNavItem(
            imagePath: 'assets/images/image.png',
            imageWidth: 28.97,
            imageHeight: 34.34,
            label: 'Uploads',
            index: 0,
          ),
          _buildNavItem(
            imagePath: 'assets/images/Exhibitions.png',
            imageWidth: 30.96,
            imageHeight: 30.96,
            label: 'Exhibitions',
            index: 1,
          ),
          _buildNavItem(
             imagePath: 'assets/images/Revenue.png',
            imageWidth: 53,
            imageHeight: 24,
            label: 'Revenue',
            index: 2,
          ),
        ],
      ),
    );
  }
  
  Widget _buildNavItem({
    IconData? icon,
    String? imagePath,
    double? imageWidth,
    double? imageHeight,
    required String label,
    required int index,
  }) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey,
            )
          else if (imagePath != null)
            Image.asset(
              imagePath,
              width: imageWidth,
              height: imageHeight,
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

class _PersonGlyphPainter extends CustomPainter {
  const _PersonGlyphPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Head circle (fits into 17.98x19 box like Figma)
    final double headDiameter = 9.6;
    final double headRadius = headDiameter / 2;
    final Offset headCenter = Offset(size.width / 2, 5.5);
    canvas.drawCircle(headCenter, headRadius, strokePaint);

    // Body rounded-rect outline
    final double margin = 0.8; // visual inset to match Figma padding
    final double bodyTop = 8.8;
    final Rect bodyRect = Rect.fromLTWH(
      margin,
      bodyTop,
      size.width - margin * 2,
      size.height - bodyTop - margin,
    );
    final RRect rrect = RRect.fromRectAndRadius(bodyRect, const Radius.circular(3.2));
    canvas.drawRRect(rrect, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _PersonGlyphPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}