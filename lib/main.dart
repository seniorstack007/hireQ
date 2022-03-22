import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hire_q/helpers/routes.dart';
import 'package:hire_q/helpers/constants.dart';
import 'package:hire_q/helpers/strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hire_q/screens/splash/splash_screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  FluroRouter.setupRouter();
  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: primaryColor,
        // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        //     .apply(bodyColor: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      // onUnknownRoute: (settings) => MaterialPageRoute(
      //   builder: (context) => NotFoundPage(),
      // ),
      onGenerateRoute: FluroRouter.router.generator,
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}
