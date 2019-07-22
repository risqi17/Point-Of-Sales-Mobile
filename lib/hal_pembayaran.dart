import 'package:flutter/material.dart';
import 'hal_status_pembayaran.dart' as status;

var bt1 = Color(0xff4facfe);
var bt2 = Color(0xff00f2fe);
class Pembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.redAccent[400],
          title: new Text("Pembayaran"),
        ),
        backgroundColor: Color(0xffF0EEF1),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child:
                      HorizontalDivider(MediaQuery.of(context).size.width / 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Text('Jenis pembayaran',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:4.0),
                        child: ButtonTheme(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.redAccent[200],
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Tunai',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ButtonTheme(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.redAccent[200],
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Kartu',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: HorizontalDivider(MediaQuery.of(context).size.width / 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Text('Jumlah bayar',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Jumlah nominal',
                  ),
              ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210.0),
                  child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 30,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Total transaksi',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            Text(
                              'Rp.100.000,-',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    RaisedGradientButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Center(
                              child: Text(
                                'Bayar',
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
                        onPressed: () {
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => status.StatusPembayaran()
                          ));
                        }),
                  ],
              ),
            ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}


class VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0,
      width: 1.0,
      color: Colors.grey,
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
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
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ]),
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
