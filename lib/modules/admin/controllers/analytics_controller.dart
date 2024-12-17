import 'package:get/get.dart';

class AnalyticsController extends GetxController {
  // Sample data for analytics
  var totalRevenue = 0.obs;
  var totalOrders = 0.obs;
  var totalCustomers = 0.obs;

  // Monthly revenue data (mock data for charts)
  var monthlyRevenue = <String, double>{
    'Jan': 5000,
    'Feb': 7500,
    'Mar': 6200,
    'Apr': 9100,
    'May': 8200,
    'Jun': 7600,
  }.obs;

  // Order distribution data (mock data for charts)
  var orderDistribution = <String, int>{
    'Electronics': 300,
    'Clothing': 450,
    'Home & Kitchen': 200,
    'Books': 150,
    'Other': 100,
  }.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAnalyticsData();
  }

  // Simulate fetching analytics data from an API
  void fetchAnalyticsData() async {
    await Future.delayed(const Duration(seconds: 2));

    // Mock analytics data
    totalRevenue.value = 45600;
    totalOrders.value = 1200;
    totalCustomers.value = 950;

    // Mock order distribution data
    orderDistribution.value = {
      'Electronics': 320,
      'Clothing': 470,
      'Home & Kitchen': 210,
      'Books': 160,
      'Other': 110,
    };
  }
}
