import 'package:flutter/material.dart';
var dustyGrass1 = Color(0xffd4fc79);
var dustyGrass2 = Color(0xff96e6a1);
var bt1 = Color(0xff43e97b);
var bt2 = Color(0xff38f9d7);
var imgSuccess = 'img/checked.png';

class StatusPembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: '',
      home: new Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.grey[100],
          appBar: new AppBar(
            backgroundColor: Colors.redAccent[400],
            title: new Text("Status Pembayaran"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50.0,),
                  Image.asset(imgSuccess, width: 100.0,),
                  SizedBox(height: 20.0,),
                  Text('Pembayaran berhasil', style: TextStyle(fontSize: 25.0, color: Colors.grey[500], fontWeight: FontWeight.bold),),
                  Text('Kembalian', style: TextStyle(fontSize: 25.0, color: Colors.grey[500], fontWeight: FontWeight.bold)),
                  Text('Rp. 6.000,-', style: TextStyle(fontSize: 35.0, color: Colors.black54, fontWeight: FontWeight.bold)),
                  SizedBox(height: 60.0,),
                  RaisedGradientButton(
                    child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                              child: Text(
                                'Email struk',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                          
                          ),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[bt1, bt2],
                        ),
                        onPressed: () {}
                  ),
                  SizedBox(height: 20.0,),
                  HorizontalDivider(MediaQuery.of(context).size.width/1),
                  SizedBox(height: 20.0,),
                  RaisedGradientButton(
                    child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                              child: Text(
                                'Cetak struk',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                          
                          ),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[bt1, bt2],
                        ),
                        onPressed: () {}
                  ),
                  SizedBox(height: 20.0,),
                   RaisedNoGradientButton(
                    child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                              child: Text(
                                'Tidak, Terima kasih !!!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                          
                          ),
                        ),
                        color: Colors.grey[300],
                        onPressed: () {}
                  ),
                ],
              ),
            ),
          ),
          ),
    );
  }
}

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(gradient: gradient, boxShadow: [
        BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.0, 0.0),
          blurRadius: 1.5,
        ),
      ],
      borderRadius: BorderRadius.circular(16.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
class RaisedNoGradientButton extends StatelessWidget {
  final Widget child;
  final color;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedNoGradientButton({
    Key key,
    @required this.child,
    this.color,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(color: color, boxShadow: [
        BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.0, 0.0),
          blurRadius: 1.5,
        ),
      ],
      borderRadius: BorderRadius.circular(16.0)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  final width;
  HorizontalDivider(this.width);
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 1.0,
      width: width,
      color: Colors.grey,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}