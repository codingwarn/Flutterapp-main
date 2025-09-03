import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/core/di/injection.dart';
import 'package:flutter_gallery_app/presentation/blocs/photo/photo_bloc.dart';
import 'package:flutter_gallery_app/presentation/pages/dashboard_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PhotoBloc>(
          create: (_) => getIt<PhotoBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'AGC Art Gallery',
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: const Color(0xFF4A1E5F),
            secondary: const Color(0xFFE91E63),
            tertiary: const Color(0xFFF44336),
            background: Colors.white,
            surface: Colors.white,
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        home: const DashboardPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
