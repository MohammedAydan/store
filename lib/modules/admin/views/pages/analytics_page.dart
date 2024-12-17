import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/admin/controllers/analytics_controller.dart';

class AnalyticsPage extends StatelessWidget {
  AnalyticsPage({super.key});
  final AnalyticsController controller = Get.put(AnalyticsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Obx(() {
        if (controller.totalRevenue.value == 0 &&
            controller.totalOrders.value == 0 &&
            controller.totalCustomers.value == 0) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Summary Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSummaryCard(
                    'Total Revenue',
                    '\$${controller.totalRevenue.value}',
                    Icons.attach_money,
                    Colors.green,
                  ),
                  _buildSummaryCard(
                    'Total Orders',
                    '${controller.totalOrders.value}',
                    Icons.shopping_cart,
                    Colors.blue,
                  ),
                  _buildSummaryCard(
                    'Total Customers',
                    '${controller.totalCustomers.value}',
                    Icons.people,
                    Colors.orange,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Bar Chart Title
              const Text(
                'Monthly Revenue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),

              // Bar Chart
              Container(
                height: 300,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 10000,
                    barTouchData: BarTouchData(enabled: true),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          reservedSize: 44,
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '\$${value.toInt()}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final month = controller.monthlyRevenue.keys
                                .toList()[value.toInt()];
                            return Text(
                              month,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    barGroups: controller.monthlyRevenue.entries
                        .map((entry) => BarChartGroupData(
                              x: controller.monthlyRevenue.keys
                                  .toList()
                                  .indexOf(entry.key),
                              barRods: [
                                BarChartRodData(
                                  toY: entry.value,
                                  color: Colors.deepPurple,
                                  width: 16,
                                )
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Pie Chart Title
              const Text(
                'Order Distribution',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),

              // Pie Chart
              Container(
                height: 300,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: PieChart(
                  PieChartData(
                    sections: controller.orderDistribution.entries
                        .map((entry) => PieChartSectionData(
                              value: entry.value.toDouble(),
                              title: '${entry.value}%',
                              color: _getColorForCategory(entry.key),
                              radius: 50,
                              titleStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Widget to create summary cards
  Widget _buildSummaryCard(
      String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        height: 180,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: color),
            const SizedBox(height: 8),
            const Divider(),
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            const Divider(),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to get color for pie chart sections
  Color _getColorForCategory(String category) {
    switch (category) {
      case 'Electronics':
        return Colors.blue;
      case 'Fashion':
        return Colors.pink;
      case 'Home':
        return Colors.green;
      case 'Beauty':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
