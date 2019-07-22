import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'hal_transaksi.dart' as trans;
import 'hal_pembayaran.dart' as bayar;

void main() => runApp(new DetailPesanan());
var makanan1 =
    'https://eksotisjogja.com/wp-content/uploads/2017/06/Cenil-Jajanan-Pasar-Khas-Yogyakarta.jpg';
var makanan2 =
    'https://phinemo.com/wp-content/uploads/2017/09/19050508_109605866314963_1210741239108861952_n.jpg';
var makanan3 =
    'https://media.travelingyuk.com/wp-content/uploads/2016/10/Soto-Sulung.jpg';
var makanan4 =
    'http://tempatwisataindonesia.id/wp-content/uploads/2017/07/Krecek_Jogja.jpg';

var btSimpan1 = Color(0xffa1c4fd);
var btSimpan2 = Color(0xffc2e9fb);
var btBayar1 = Color(0xffd4fc79);
var btBayar2 = Color(0xff96e6a1);

class DetailPesanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: new AppBar(
          backgroundColor: Colors.redAccent[400],
          title: new Text('Detail pesanan'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('132',
                                      style: TextStyle(
                                          fontSize: 40.0, color: Colors.grey)),
                                  VerticalDivider(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Nama pembeli / Meja makan',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text('data')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            HorizontalDivider(400.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 16.0, right: 16.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    ListPesanan('Tempe Goreng Crispy', makanan2,
                                        3, 1000, 3000, 'Pedas Cabe 5'),
                                    ListPesanan('Kol Goreng Nikmat', makanan1,
                                        3, 1000, 3000, 'Pedas Cabe 5'),
                                    ListPesanan('Sate Kambing', makanan3, 3,
                                        1000, 3000, 'Pedas Cabe 5'),
                                    ListPesanan('Sate Ayam Madura', makanan4, 3,
                                        1000, 3000, 'Pedas Cabe 5'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.0,
            ),
            Container(
              child: Column(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RaisedGradientButton(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Center(
                              child: Text(
                                'Simpan',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[btSimpan1, btSimpan2],
                          ),
                          width: MediaQuery.of(context).size.width / 2,
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => trans.Transaksi()));
                          }),
                      RaisedGradientButton(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                            colors: <Color>[btBayar2, btBayar1],
                          ),
                          width: MediaQuery.of(context).size.width / 2,
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => bayar.Pembayaran()));
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: ButtonDetail(
        //   onPressed: () {},
        // ),
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

class ListPesanan extends StatelessWidget {
  final menu;
  final image;
  final jumlah;
  final harga;
  final total;
  final catatan;
  ListPesanan(
      this.menu, this.image, this.jumlah, this.harga, this.total, this.catatan);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(image),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        menu,
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Text(
                        jumlah.toString() + 'XRp.' + harga.toString()+",-",
                        style: TextStyle(fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.chat_bubble,
                            size: 15.0,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(catatan,
                              style: TextStyle(
                                  fontSize: 10.0, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Text(
                      "Rp. "+total.toString()+",-",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        HorizontalDivider(270.0),
        SizedBox(
          height: 10.0,
        ),
      ],
    ));
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
