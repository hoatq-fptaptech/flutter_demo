import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/model/entity/product.dart';
import 'package:flutter_demo/model/response_api/list_product.dart';
import 'package:flutter_demo/presentation/home/ui/popuplar_item.dart';

class Popular extends StatefulWidget{
  const Popular({Key? key}) : super(key: key);

  @override
  _PopularState createState()=> _PopularState();
}

class _PopularState extends State<Popular>{
  // final RestApi apiService = RestApi();
  late List<Product> products = [];
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      // Gọi API để lấy danh sách người dùng
      Response response = await Dio().get('https://dummyjson.com/products?limit=12');

      // Chuyển đổi dữ liệu từ JSON về object User
      ListProduct jsonData = ListProduct.fromJson(response.data);
      // print(jsonData);
      // List<Product> data = jsonData.map((json) => Product.fromJson(json)).toList();
      // print(data);
      setState(() {
        products = jsonData.products!;
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: const Text("Popular",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            physics:NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context,index){
              return Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: PopularItem(product: products[index]),
              );
            },
          ),
        )
      ],
    );
  }

}