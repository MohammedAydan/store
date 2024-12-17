import 'package:flutter/widgets.dart';

class TrackingStep {
  String label;
  IconData icon;
  Color color;
  bool isCompleted;

  TrackingStep({
    required this.label,
    required this.icon,
    required this.color,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'icon': icon.codePoint,
      'color': color.value,
      'isCompleted': isCompleted,
    };
  }

  factory TrackingStep.fromMap(Map<String, dynamic> map) {
    return TrackingStep(
      label: map['label'],
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      color: Color(map['color']),
      isCompleted: map['isCompleted'],
    );
  }
}
