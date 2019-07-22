import 'package:flutter/material.dart';

void main() => runApp(new Akun());
var dustyGrass1 = Color(0xffd4fc79);
var dustyGrass2 = Color(0xff96e6a1);

class Akun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var btKeluar = new ButtonTheme(
      height: 50.0,
      minWidth: double.infinity,
      child: RaisedButton(
        onPressed: () {},
        color: Colors.white,
        textColor: Colors.redAccent[200],
        padding: EdgeInsets.all(3.0),
        child: Text(
          'Keluar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );

    return MaterialApp(
      title: '',
      home: new Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.grey[100],
          appBar: new AppBar(
            backgroundColor: Colors.redAccent[400],
            title: new Text("Profil pengguna"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ProfilCard(),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 2.0, right: 2.0),
                  child: btKeluar,
                ),
              ],
            ),
          ),
          ),
    );
  }
}

var bt1 = Color(0xff84fab0);
var bt2 = Color(0xff8fd3f4);
class ProfilCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370.0,
      child: Card(
        child: Column(
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
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama Pengguna',
                  hintText: 'Nama Saya',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Alamat email',
                  hintText: 'nama@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: '.............',
                ),
              ),
            ),
           Padding(
             padding: const EdgeInsets.only(top: 20.0, right: 20.0),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                  RaisedGradientButton(
                    child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Center(
                              child: Text(
                                'Simpan',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                          
                          ),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[bt1, bt2],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        onPressed: () {}
                  ),
               ],
             ),
           ),
          
          ],
        ),
      ),
    );
  }
}
class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 40.0,
      decoration: BoxDecoration(gradient: gradient, boxShadow: [
        BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
       
      ],
      borderRadius:  BorderRadius.circular(16.0),
      ),
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