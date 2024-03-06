import 'package:dio/dio.dart';
import 'package:flutter_demo/model/entity/product.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://dummyjson.com/products")
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/?limit=12")
  Future<List<Product>> getProducts();
}



