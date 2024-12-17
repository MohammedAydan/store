import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/admin/controllers/inital_card_settings_controller.dart';

class AddEditInitialCardPage extends StatelessWidget {
  const AddEditInitialCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final InitalCardSettingsController controller =
        Get.find<InitalCardSettingsController>();

    print(controller.cards.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Card'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _buildTextField(
              label: 'ID',
              onChanged: (value) => controller.editingCard.value.id = value,
              initialValue: controller.editingCard.value.id,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              label: 'Title',
              onChanged: (value) => controller.editingCard.value.title = value,
              initialValue: controller.editingCard.value.title,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              label: 'Description',
              maxLines: 3,
              onChanged: (value) =>
                  controller.editingCard.value.description = value,
              initialValue: controller.editingCard.value.description,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              label: 'Image URL',
              onChanged: (value) => controller.editingCard.value.image = value,
              initialValue: controller.editingCard.value.image,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              label: 'Route',
              onChanged: (value) => controller.editingCard.value.route = value,
              initialValue: controller.editingCard.value.route,
            ),
            const SizedBox(height: 10),
            _buildTextField(
              label: 'Color (Hex Code)',
              hint: '#FFFFFF',
              onChanged: (value) => controller.editingCard.value.color = value,
              initialValue: controller.editingCard.value.color,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.theme.primaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => controller.addInitalCard(),
                child: const Text('Add Card'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget _buildTextField({
    required String label,
    String? hint,
    int maxLines = 1,
    Function(String)? onChanged,
    TextEditingController? textController,
    String? initialValue,
  }) {
    return TextFormField(
      initialValue: initialValue,
      controller: textController,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
      ),
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}
