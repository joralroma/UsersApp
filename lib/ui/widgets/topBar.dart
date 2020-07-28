import 'package:flutter/material.dart';

// Utils
import 'package:users/utils/style.dart';
import 'package:users/utils/responsive.dart';

class TopBar extends StatelessWidget {
  
  const TopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int itemActivated = 0;

    Responsive responsive = Responsive(context);

    Widget _buildItem(IconData icon, String text, int index) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          color: (itemActivated == index) ? Style.PrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 26,
              color: Style.BtnColor,
            ),
            if (itemActivated == index)
              Container(
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  text,
                  style: Style.StyleText.copyWith( color: Style.BtnColor, fontSize: 16 ),
                ),
              )
          ],
        ),
      );
    }

    Widget _buildListItems() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildItem(Icons.home, 'Home', 0),
          _buildItem(Icons.chat, 'Chat', 1),
          _buildItem(Icons.favorite_border, 'Favorite', 2),
          _buildItem(Icons.person_outline, 'Profile', 3),
        ],
      );
    }    

    return Container(
      width: responsive.width,
      height: 110,
      padding: const EdgeInsets.only(top: 0, right: 10, bottom: 15, left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0
          )
        ]
      ),
      child: _buildListItems(),
    );

  }



}