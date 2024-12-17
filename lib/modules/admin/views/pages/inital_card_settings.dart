import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/di.dart';
import 'package:store_app/modules/admin/controllers/inital_card_settings_controller.dart';
import 'package:store_app/modules/admin/views/pages/add_edit_initial_card_page.dart';

class InitialCardSettings extends StatelessWidget {
  InitialCardSettings({super.key});

  final InitalCardSettingsController controller =
      Get.put(InitalCardSettingsController(di()), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: const Text('Manage inital cards'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const AddEditInitialCardPage());
            },
            icon: const Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error.value.isNotEmpty) {
            return Center(child: Text('Error: ${controller.error.value}'));
          }

          return ListView.builder(
            itemCount: controller.cards.length,
            itemBuilder: (context, index) {
              final card = controller.cards[index];
              return Card.filled(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.setEditingCard(card);
                              Get.to(
                                () => const AddEditInitialCardPage(),
                                arguments: controller,
                              );
                            },
                            child: const Text('Edit'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              controller.deleteInitalCard(card.id);
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                      ListTile(
                        title: const Text('ID'),
                        subtitle: Text(card.id),
                      ),
                      ListTile(
                        title: const Text('Title'),
                        subtitle: Text(card.title),
                      ),
                      ListTile(
                        title: const Text('Description'),
                        subtitle: Text(card.description),
                      ),
                      ListTile(
                        leading: Image.network(
                          card.image,
                          width: 100,
                        ),
                        title: const Text('Image'),
                        subtitle: Text(card.image),
                      ),
                      ListTile(
                        title: const Text('Route'),
                        subtitle: Text(card.route),
                      ),
                      ListTile(
                        leading: const SizedBox(
                          width: 10,
                          height: 10,
                          // color: card.color,
                        ),
                        title: const Text('Color'),
                        subtitle: Text(card.color),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
