import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// Routes
import 'package:users/routes/routes.dart';

// Pages
import 'package:users/ui/pages/splashPage.dart';

// Controllers
import 'package:users/controllers/homeController.dart';
import 'package:users/controllers/loginController.dart';
import 'package:users/controllers/locationController.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(MyApp())
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationController>.value(value: LocationController()),
        ChangeNotifierProvider<LoginController>.value(value: LoginController()),
        ChangeNotifierProvider<HomeController>.value(value: HomeController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Users App',
        theme: ThemeData(),
        routes: routes,
        home: SplashPage(),
      ),
    );
  }
}
