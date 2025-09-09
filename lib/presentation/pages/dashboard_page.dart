
import 'package:flutter/material.dart';
import 'dart:ui' show FontVariation;
import 'dart:ui' show FontVariation;
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
        leadingWidth: 122,
        leading: Padding(
          padding: const EdgeInsets.only(top: 27, left: 40.0),
          child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 26,
              height: 28,
              child: CircleAvatar(
                radius: 13,
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
            padding: const EdgeInsets.only(right: 20.0),
            child: SizedBox(
              width: 33,
              height: 33,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 33,
                    height: 33,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD1163A),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 17.98,
                    height: 19,
                    child: Image.asset(
                      'assets/images/personicon.png',
                      width: 17.98,
                      height: 19,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 34.0),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 34.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/image.png',
                      width: 27.97,
                      height: 32.39,
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 65,
                      height: 24,
                      child: Center(
                        child: Text(
                          'Upload',
                          style: GoogleFonts.barlowCondensed(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            height: 24 / 14,
                            letterSpacing: 0,
                            color: Color(0xFF5E7BB5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 63.5,
                        backgroundImage: AssetImage('assets/images/avatter.jpeg'),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 34.0),
                child: Column(
                  children: [
                     Image.asset(
                      'assets/images/edit.png',
                      width: 26.99,
                      height: 26.99,
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 65,
                      height: 24,
                      child: Center(
                        child: Text(
                          'Edit',
                          style: GoogleFonts.barlowCondensed(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            height: 24 / 14,
                            letterSpacing: 0,
                            color: Color(0xFF5E7BB5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          SizedBox(
            width: 267,
            height: 28,
            child: Center(
              child: Text(
                'john.doe',
                textAlign: TextAlign.center,
                style: GoogleFonts.barlow(
                  fontSize: 36,
                  height: 28 / 36,
                  letterSpacing: -1.32,
                  color: const Color(0xFF000000),
                ).copyWith(
                  fontVariations: const [FontVariation('wght', 275)],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),
            child: Row(
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
                            height: 24 / 14,
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                ),
                const _FigmaSwitch(initialValue: true),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 332,
              height: 2,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFDBDBD8)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatColumn('2.3K', 'Followers'),
              _buildStatColumn('50', 'Artworks'),
              _buildStatColumn('21', 'Exhibitions'),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 332,
              height: 2,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFDBDBD8)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
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
          
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 340,
              height: 42,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/colorimage.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 9,
                    child: SizedBox(
                      width: 80,
                      height: 24,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'pallette',
                          style: GoogleFonts.barlowCondensed(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 24 / 14,
                            letterSpacing: 0,
                            color: Colors.white,
                          ),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
            textStyle: GoogleFonts.barlow(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 24 / 14,
              letterSpacing: 0,
              color: const Color(0xFF000000),
            ),
          ),
          _buildNavItem(
            imagePath: 'assets/images/Exhibitions.png',
            imageWidth: 30.96,
            imageHeight: 30.96,
            label: 'Exhibitions',
            index: 1,
            textStyle: GoogleFonts.barlow(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 24 / 14,
              letterSpacing: 0,
              color: const Color(0x75000000),
            ),
          ),
          _buildNavItem(
             imagePath: 'assets/images/Revenue.png',
            imageWidth: 33,
            imageHeight: 28,
            label: 'Revenue',
            index: 2,
            textStyle: GoogleFonts.barlow(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 24 / 14,
              letterSpacing: 0,
              color: const Color(0x75000000),
            ),
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
    TextStyle? textStyle,
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
            style: textStyle ?? TextStyle(
              color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            width: 65,
            color: isSelected ? const Color(0xFFFFB500) : Colors.transparent,
          ),
        ],
      ),
    );
  }
  
  Widget _buildGalleryGrid() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Consumer<PhotoViewModel>(
        builder: (context, vm, _) {
          if ((vm.status == PhotoVmStatus.initial || vm.status == PhotoVmStatus.loading) && vm.photos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (vm.status == PhotoVmStatus.error) {
            return Center(child: Text('Error: ${vm.errorMessage}'));
          } else if (vm.photos.isEmpty) {
            return const Center(child: Text('No photos available'));
          }

          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 340,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.993,
                  crossAxisSpacing: 6.12,
                  mainAxisSpacing: 8,
                ),
                itemCount: vm.photos.length,
                itemBuilder: (context, index) {
                  final photo = vm.photos[index];
                  return SizedBox(
                    width: 166.94,
                    height: 168,
                    child: ClipRRect(
                      borderRadius: BorderRadius.zero,
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
                    ),
                  );
                },
              ),
            ),
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
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Head circle - positioned to match Figma reference
    final double headDiameter = 7.0;
    final double headRadius = headDiameter / 2;
    final Offset headCenter = Offset(size.width / 2, 5.5);
    canvas.drawCircle(headCenter, headRadius, strokePaint);

    // Body - rounded trapezoid/U-shape to match Figma reference
    final double bodyTop = 9.0;
    final double bodyBottom = size.height - 2.0;
    final double bodyWidthTop = size.width * 0.55;  // narrower at top
    final double bodyWidthBottom = size.width * 0.75; // wider at bottom
    
    final Path bodyPath = Path();
    // Start from top-left with rounded corner
    bodyPath.moveTo((size.width - bodyWidthTop) / 2 + 1.5, bodyTop);
    // Top edge
    bodyPath.lineTo((size.width + bodyWidthTop) / 2 - 1.5, bodyTop);
    // Right side with slight curve
    bodyPath.quadraticBezierTo(
      (size.width + bodyWidthBottom) / 2, bodyTop + 2,
      (size.width + bodyWidthBottom) / 2, bodyBottom - 1.5
    );
    // Bottom edge
    bodyPath.lineTo((size.width + bodyWidthBottom) / 2, bodyBottom);
    bodyPath.lineTo((size.width - bodyWidthBottom) / 2, bodyBottom);
    // Left side with slight curve
    bodyPath.quadraticBezierTo(
      (size.width - bodyWidthBottom) / 2, bodyBottom - 1.5,
      (size.width - bodyWidthTop) / 2, bodyTop + 2
    );
    // Close with rounded top-left corner
    bodyPath.quadraticBezierTo(
      (size.width - bodyWidthTop) / 2, bodyTop,
      (size.width - bodyWidthTop) / 2 + 1.5, bodyTop
    );
    bodyPath.close();
    
    canvas.drawPath(bodyPath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _PersonGlyphPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

class _FigmaSwitch extends StatefulWidget {
  const _FigmaSwitch({required this.initialValue});
  final bool initialValue;

  @override
  State<_FigmaSwitch> createState() => _FigmaSwitchState();
}

class _FigmaSwitchState extends State<_FigmaSwitch> with SingleTickerProviderStateMixin {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 17,
      child: GestureDetector(
        onTap: () => setState(() => _value = !_value),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            // Track
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 46,
              height: 17,
              decoration: BoxDecoration(
                color: _value ? const Color(0xFF3AA34A) : const Color(0xFFDBDBD8),
                borderRadius: BorderRadius.circular(17 / 2),
              ),
            ),
            // Thumb oversized with shadow
            AnimatedPositioned(
              duration: const Duration(milliseconds: 180),
              left: _value ? 22 : -1,
              top: -6,
              child: Container(
                width: 29,
                height: 29,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2E6B2F),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

