import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget {
  FancyButton({@required this.onPressed});
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        width: 357.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            
            gradient: LinearGradient(
                end: Alignment.topRight,
                begin: Alignment.bottomLeft,
                colors: [Color(0xfff83600).withOpacity(0.8), Color(0xfff9d423).withOpacity(0.8)])
                ),
        child: Row(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              '14',
              style: TextStyle(color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
          ),
          VerticalDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Rp. 100.000,-',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text('Lihat pesanan',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 110.0),
                child: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
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
