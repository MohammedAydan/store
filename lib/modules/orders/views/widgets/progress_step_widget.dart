import 'package:flutter/material.dart';

class ProgressStepWidget extends StatelessWidget {
  const ProgressStepWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.isCompleted,
  });

  final String label;
  final IconData icon;
  final Color color;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              color: isCompleted ? color : Colors.grey.shade300,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: isCompleted ? color : Colors.grey.shade300,
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isCompleted ? Colors.black : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
