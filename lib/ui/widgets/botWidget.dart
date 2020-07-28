import 'package:flutter/material.dart';

class BotWidget extends StatelessWidget {
  
  const BotWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Hero(
        tag: 'bot',
        child: Center(
          child: Image(
            image: AssetImage('assets/Imgs/bot.png'),
            width: 300,
          ),
        ),
      )
    );
  }
}