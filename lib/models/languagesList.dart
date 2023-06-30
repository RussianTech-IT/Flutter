import 'package:flutter/material.dart';

class LanguagesList {
  final List<Map<String, dynamic>> languages = [
    {'name': 'JavaScript', 'icon': Icons.code},
    {'name': 'Python', 'icon': Icons.code},
    {'name': 'Java', 'icon': Icons.code},
    {'name': 'C++', 'icon': Icons.code},
    {'name': 'Swift', 'icon': Icons.code},
    {'name': 'Ruby', 'icon': Icons.code},
    {'name': 'C#', 'icon': Icons.code}, // Add: C#
    {'name': 'Dart', 'icon': Icons.code}, // Add: Dart
    {'name': 'Kotlin', 'icon': Icons.code}, // Add: Kotlin
    {'name': 'Vue.js', 'icon': Icons.code}, // Add: Vue.js
    {'name': 'React', 'icon': Icons.code}, // Add: React
  ];
  
  List<Map<String, dynamic>> get _languages => languages;
}
