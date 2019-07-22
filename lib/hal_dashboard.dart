import 'package:flutter/material.dart';
import 'hal_menu.dart';
import 'hal_transaksi.dart' as trans;

void main() => runApp(new Dashboard());

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var btPesananBaru = RaisedGradientButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Transaksi baru', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),),
              Icon(Icons.chevron_right, color: Colors.white,),
            ],
          ),
        ),
        gradient: LinearGradient(
          colors: <Color>[Color(0xfff83600), Color(0xfff9d423)],
        ),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(
            builder: (context) => Menu()
          ),);
        });

    var card = new Card(
      child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: new Center(
              child: new Image.asset(
                "img/man.png",
                width: 100.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: new Icon(Icons.people),
                ),
                new Text("Risqi Ahmad Sultoni")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: new Icon(Icons.email),
                ),
                new Text("ahmadreys@gmail.com")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: new Icon(Icons.call),
                ),
                new Text("+62 8223 4278 915")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  "Edit",
                  style: new TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                new Icon(Icons.chevron_right)
              ],
            ),
          )
        ],
      ),
    );

    final sizedBox = new Container(
      margin: new EdgeInsets.only(left: 0.0, right: 0.0),
      child: new SizedBox(
        height: 290.0,
        child: card,
      ),
    );

    return new MaterialApp(
      title: "",
      home: new Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: new AppBar(
            backgroundColor: Color(0xffff0844),
            title: new Text("Dashboard"),
          ),
          body: new Column(
            children: <Widget>[
              sizedBox,
              new PesananAktif(),
              TotalTransaksi(),
              Padding(
                padding: const EdgeInsets.only(top: 93.0),
                child: btPesananBaru,
              ),
            ],
          )),
    );
  }
}

class PesananAktif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(top: 1.0, left: 2.0, right: 2.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, new MaterialPageRoute(
            builder: (context) => trans.Transaksi()
          ));
        },
        child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 85.0,
                width:85.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      dustyGrass1, dustyGrass2
                    ]
                  )
                ),
                child: Center(
                  child: 
                      Icon(Icons.confirmation_number, color: Colors.white, size: 50.0,),
                ),
              ),
              SizedBox(width: 15.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Pesanan Aktif",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "75",
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(''),
                      Row(
                        
                        children: <Widget>[
                          Text(
                            "Lihat pesanan aktif",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.chevron_right)
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}

var dustyGrass1 = Color(0xffd4fc79);
var dustyGrass2 = Color(0xff96e6a1);
var winterNova1 = Color(0xffa1c4fd);
var winterNova2 = Color(0xffc2e9fb);

class TotalTransaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1.0, left: 2.0, right: 2.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 85.0,
                width: 85.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [winterNova1, winterNova2]
                  )
                ),
                child: Center(
                  child: 
                      Icon(Icons.attach_money, color: Colors.white, size: 50.0,),
                ),
              ),
              SizedBox(
                height: 80.0,
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Transaksi hari ini',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('320',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold)),
                  Text('Rp. 12.000.000,-',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold)),
                ],
              )
            ],
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
