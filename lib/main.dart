import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grduation_proj/view/splash_page.dart';
import 'package:sizer/sizer.dart';
import 'package:grduation_proj/cubit/auth/auth_cubit.dart';
import 'package:grduation_proj/cubit/maps/maps_cubit.dart';
import 'package:grduation_proj/firebase_options.dart';
import 'package:grduation_proj/shared/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(),
            ),
            BlocProvider(
              create: (context) => MapsCubit(),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashPage(),
          ),
        );
      },
    );
  }
}
