import 'package:flutter/material.dart';

class TrackingHistory {
  String title;
  String subtitle;
  IconData icon;
  Color iconColor;

  TrackingHistory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'icon': icon.codePoint,
      'iconColor': iconColor.value,
    };
  }

  factory TrackingHistory.fromMap(Map<String, dynamic> map) {
    return TrackingHistory(
      title: map['title'],
      subtitle: map['subtitle'],
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      iconColor: Color(map['iconColor']),
    );
  }
}
