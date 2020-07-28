import 'package:flutter/material.dart';

// Models
import 'package:users/models/user.dart';

// Utils
import 'package:users/utils/style.dart';
import 'package:users/utils/responsive.dart';


class CardUser extends StatelessWidget {

  final User user;

  const CardUser({
    Key key,
    @required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Responsive responsive = Responsive(context);

    double heightCard = 90;
    double borderRadius = 20;

    return Container(
      width: double.infinity,
      height: heightCard,
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Style.PrimaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            offset: Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 0
          )
        ]        
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              '${user.avatar}',
              height: heightCard,
              width: heightCard,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${user.first_name.toUpperCase()} ${user.last_name.toUpperCase()}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Style.StyleTitle.copyWith(color: Style.BtnColor, fontSize: responsive.ip(1.8)),
                ),
                Text(
                  '${user.email}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,                  
                  style: Style.StyleText.copyWith(fontSize: responsive.ip(1.6)),
                ),
              ],
            )
          ),
          Icon(
            Icons.arrow_forward_ios,
            // color: Style.PrimaryColor,
          )
        ],
      ),
    );
  }
}