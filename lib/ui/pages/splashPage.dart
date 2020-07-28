import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// External Packages
import 'package:users/controllers/locationController.dart';

// Widgets
import 'package:users/ui/widgets/botWidget.dart';

// Utils
import 'package:users/utils/style.dart';
import 'package:users/utils/responsive.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>  with WidgetsBindingObserver {

  LocationController _locationController;

  Responsive responsive;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initState());   
  }

  _initState() {
    WidgetsBinding.instance.addObserver(this);
    _locationController = Provider.of<LocationController>(context, listen: false);
    _locationController.checkLocation(context); 
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed) {
      _locationController.checkLocation(context);
    }
  }  

  @override
  Widget build(BuildContext context) {

    responsive = Responsive(context);

    Widget _btnLogin = Consumer<LocationController>(
      builder: (_, locationController, __) => MaterialButton(
        onPressed: locationController.permissionLocation ? () => Navigator.of(context).pushReplacementNamed('login') : null,
        minWidth: responsive.wp(85),
        height: 55,
        color: Style.BtnColor,
        disabledColor: Colors.black12,
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(30) ),
        child: Text(
          'LOGIN',
          style: Style.StyleText.copyWith( color: Colors.white, letterSpacing: 2, fontSize: responsive.ip(1.8) ),
        ),
      )
    );

    Widget _contentTop = Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              'USERSAPP',
              style: Style.StyleTitle.copyWith( color: Colors.white, fontSize: responsive.ip(3.5), letterSpacing: 1.6 ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to the app for vip users, to be able to access this app and get all the benefits it offers you must grant the geolocation permissions.',
              textAlign: TextAlign.center,
              style: Style.StyleTitle.copyWith( fontSize: responsive.ip(2.0) ),
            ),
            SizedBox(height: 20),
            _btnLogin
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Style.PrimaryColor,
      body: Column(
        children: <Widget>[
          _contentTop,
          const BotWidget()
        ],
      )
    );
    
  }

}