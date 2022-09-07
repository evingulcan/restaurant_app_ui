import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/feature/splash_page/view/splash_view.dart';
import 'package:restaurant_app/products/global/global.dart';
import 'package:restaurant_app/products/navigation/navigation_custom.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with NavigatorCustom {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MultiProviderInit().providers,
      child: MaterialApp(
          title: StringConstant.main,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          initialRoute: '/',
          routes: {
            "/": (context) => const SplashPage(),
          },
          onGenerateRoute: onGenerateRoute),
    );
  }
}
