class Produk {
  final String status;
  final List<Data> data;
  Produk({this.status, this.data});

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      status: json['status'], 
      data: parseData(json));
  }
  static List<Data> parseData(dataJson){
    var list = dataJson['data'] as List;
    List<Data> dataList = list.map((data) => Data.fromJson(data)).toList();
    return dataList;
  }
}
class Data {
  final String productid,
      productname,
      productstock,
      produkstatus,
      productprice,
      productimg;
  Data
    ({this.productid,
      this.productname,
      this.productstock,
      this.produkstatus,
      this.productprice,
      this.productimg});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        productid: json['productid'],
        productname: json['productname'],
        productstock: json['productstock'],
        produkstatus: json['productstatus'],
        productprice: json['productprice'],
        productimg: json['productimg']);
  }
}
