import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/routes/app_routes.dart';

// Dashboard Page
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildDashboardItem(
              context,
              icon: Icons.shopping_cart,
              label: 'Orders',
              onTap: () {
                Get.toNamed(AppRoutes.dashboardOrders);
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.category,
              label: 'Products',
              onTap: () {
                Get.toNamed(AppRoutes.dProducts);
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.people,
              label: 'Customers',
              onTap: () {
                Get.toNamed(AppRoutes.customers);
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.analytics,
              label: 'Analytics',
              onTap: () {
                Get.toNamed(AppRoutes.analytics);
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.settings,
              label: 'Settings',
              onTap: () {
                Get.toNamed(AppRoutes.settings);
              },
            ),
            _buildDashboardItem(
              context,
              icon: Icons.view_carousel_rounded,
              label: 'Inital cards',
              onTap: () {
                Get.toNamed(AppRoutes.initalCards);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0),
            const SizedBox(height: 8.0),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
