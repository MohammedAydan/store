import 'package:flutter/material.dart';
import 'package:store_app/modules/auth/controllers/edit_account_controller.dart';

class CustomDropdownButtom extends StatelessWidget {
  const CustomDropdownButtom({
    super.key,
    required this.items,
    required this.controller,
  });

  final List<String> items;
  final EditAccountController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select city",
          style: TextStyle(fontSize: 17),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field is required';
            }
            return null;
          },
          value: items.contains(controller.cityController.text.trim())
              ? controller.cityController.text.trim()
              : null, // Set null if the value is not in the list
          hint: const Text('Select city'),
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              controller.cityController.text = newValue;
            }
          },
          items: controller.cities.map<DropdownMenuItem<String>>((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Text(city),
            );
          }).toList(),
          borderRadius: BorderRadius.circular(15),
        ),
      ],
    );
  }
}
