import 'package:dio/dio.dart';
import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/services/product_services/i_product_service.dart';
import 'package:store_app/data/services/product_services/test_data.dart';

class ProductService implements IProductService {
  @override
  Future addProduct(product) async {
    // TODO: implement addProduct
    await Future.delayed(const Duration(seconds: 2));
    return await Future.value(product);
  }

  @override
  Future<Map<String, dynamic>> getProduct(String id) async {
    // TODO: implement getProduct
    await Future.delayed(const Duration(seconds: 2));
    return await Future.value(ProductModel(
      id: "id",
      name: "name",
      description: "description",
      price: 1240,
      discount: 30,
      imageUrl: "imageUrl",
      stockQuantity: 6,
      category: "category",
      brand: "brand",
      rating: 4.5,
      reviews: ["review1", "review2"],
    ).toJson());
  }

  @override
  Future<List> getProducts({int page = 1, int limit = 10}) async {
    Dio dio = Dio();
    Response response = await dio.get("https://fakestoreapi.com/products");
    List products = response.data;
    products = products
        .map((e) => ProductModel(
              id: e["id"].toString(),
              name: e["title"],
              description: e["description"],
              price: double.parse(e["price"].toString()),
              discount: 0,
              imageUrl: e["image"],
              stockQuantity: 6,
              category: e["category"],
              brand: "brand",
              rating: double.parse(e["rating"]["rate"].toString()),
              reviews: ["review1", "review2"],
            ).toJson())
        .toList();
    return products;
  }

  @override
  Future updateProduct(product) async {
    // TODO: implement updateProduct
    await Future.delayed(const Duration(seconds: 2));
    return await Future.value(product);
  }

  @override
  Future deleteProduct(String id) async {
    await Future.delayed(const Duration(seconds: 2));
    return await Future.value(null);
  }

  @override
  Future<List<dynamic>> searchProducts(
    String search, {
    int page = 1,
    int limit = 10,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return testProducts
        .where((p) =>
            p["title"]
                .toString()
                .toLowerCase()
                .contains(search.toLowerCase()) ||
            p["category"]
                .toString()
                .toLowerCase()
                .contains(search.toLowerCase()) ||
            p["description"]
                .toString()
                .toLowerCase()
                .contains(search.toLowerCase()))
        .toList();
  }

  @override
  Future addReview(
      String userId, String username, String productId, review) async {
    await Future.delayed(const Duration(seconds: 2));
    return await Future.value(review);
  }
}
