import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonDetail extends StatelessWidget {
  ButtonDetail({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return 
        Container(
              height: 30.0,
              width: MediaQuery.of(context).size.width/1,
              color: Colors.yellow,
        
    );
        // height: 60.0,
        // width: MediaQuery.of(context).size.width/1,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         end: Alignment.topRight,
        //         begin: Alignment.bottomLeft,
        //         colors: [Color(0xfff83600).withOpacity(0.8), Color(0xfff9d423).withOpacity(0.8)])
        //         ),
  }
}
class VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 40.0,
      width: 1.0,
      color: Colors.white,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}
