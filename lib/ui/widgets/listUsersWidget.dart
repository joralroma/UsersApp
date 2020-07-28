import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Controllers
import 'package:users/controllers/homeController.dart';
import 'package:users/controllers/locationController.dart';

// Models
import 'package:users/models/dataResponse.dart';

// Widgets
import 'package:users/ui/widgets/cardUser.dart';

// Utils
import 'package:users/utils/style.dart';
import 'package:users/utils/session.dart';
import 'package:users/utils/responsive.dart';


class ListUsers extends StatefulWidget {
  const ListUsers({Key key}) : super(key: key);

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {

  final Session _session = Session.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initState());   
  }

  void _initState() {
    final HomeController _homeController = Provider.of<HomeController>(context, listen: false);
    _homeController.getUsers();
  }

  @override
  Widget build(BuildContext context) {

    Responsive responsive = Responsive(context);

    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 30, right: 20, bottom: 0, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Token - ${_session.getToken()}',
              textAlign: TextAlign.start,
              style: Style.StyleTitle.copyWith(color: Style.BtnColor, fontSize: responsive.ip(2.0), letterSpacing: 1.5),
            ),
            Consumer<LocationController>(
              builder: (_, locationController, __) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Latitude  ${locationController.userPosition?.latitude}',
                    textAlign: TextAlign.start,
                    style: Style.StyleTitle.copyWith(color: Style.BtnColor, fontSize: responsive.ip(2.0), letterSpacing: 1.5),
                  ),
                  Text(
                    'Longitude  ${locationController.userPosition?.longitude}',
                    textAlign: TextAlign.start,
                    style: Style.StyleTitle.copyWith(color: Style.BtnColor, fontSize: responsive.ip(2.0), letterSpacing: 1.5),
                  ),                  
                ],
              )
            ),
            Expanded(
              child: Consumer<HomeController>(
                builder: (_, homeController, __) => _buildBody(homeController)
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody(HomeController homeController) {
    switch (homeController.responseGetUsers.state) {
      case ResponseStates.LOADING:
        return _buildLoading();
      break;
      case ResponseStates.SUCCESS:
        return _buildList(homeController);
      break;
      case ResponseStates.ERROR:
        return _buildError(homeController.responseGetUsers.msm);
      break;
      
      default:
        return _buildLoading();
    }
  }


  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator()
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Text(
        'No hay usuarios registrados',
        style: Style.StyleTitle.copyWith(color: Colors.red),
      )
    );
  }

  Widget _buildList(HomeController homeController) {
    if(homeController.users.isEmpty) {
      return _buildEmpty();
    }
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemCount: homeController.users.length,
      itemBuilder: (BuildContext context, int index) => CardUser(user: homeController.users[index])
    );
  }


  Widget _buildError(String text) {
    return Center(
      child: Text(
        text,
        style: Style.StyleTitle.copyWith(color: Colors.red),
      )
    );
  }

}