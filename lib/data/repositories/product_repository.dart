import 'package:store_app/data/models/product_model.dart';
import 'package:store_app/data/services/product_services/i_product_service.dart';

class ProductRepository {
  final IProductService _productService;

  ProductRepository(this._productService);

  Future<List<ProductModel>> getProducts({int page = 1, int limit = 10}) async {
    final res = await _productService.getProducts(page: page, limit: limit);
    return res.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<ProductModel> getProduct(String id) async {
    final res = await _productService.getProduct(id);
    return ProductModel.fromJson(res);
  }

  Future<ProductModel> addProduct(dynamic product) async {
    final res = await _productService.addProduct(product);

    return ProductModel.fromJson(res);
  }

  Future<ProductModel> updateProduct(dynamic product) async {
    final res = await _productService.updateProduct(product);
    return ProductModel.fromJson(res);
  }

  Future<void> deleteProduct(String id) async {
    await _productService.deleteProduct(id);
  }

  Future<List<ProductModel>> searchProducts(
    String search, {
    int page = 1,
    int limit = 10,
  }) async {
    final res = await _productService.searchProducts(
      search,
      page: page,
      limit: limit,
    );
    print(res);
    return res.map((e) => ProductModel.fromJsonForFakestoreapiDATA(e)).toList();
  }

  Future<dynamic> addReview(
    String userId,
    String username,
    String productId,
    dynamic review,
  ) async {
    final res =
        await _productService.addReview(userId, username, productId, review);
    // convert res to a model
    return res;
  }
}
