abstract class IProductService {
  Future<List<dynamic>> getProducts({int page = 1, int limit = 10});
  Future<dynamic> getProduct(String id);
  Future<dynamic> addProduct(dynamic product);
  Future<dynamic> updateProduct(dynamic product);
  Future<void> deleteProduct(String id);
  Future<List<dynamic>> searchProducts(String sreach);
  // add review to product
  Future<dynamic> addReview(
    String userId,
    String username,
    String productId,
    dynamic review,
  );
}
