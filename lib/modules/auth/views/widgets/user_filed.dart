import 'package:flutter/material.dart';

class UserFiled extends StatelessWidget {
  const UserFiled({
    super.key,
    required this.name,
    this.data,
  });

  final String name;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            '$name: $data',
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
