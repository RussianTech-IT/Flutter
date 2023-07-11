import 'package:flutter/material.dart';
import 'package:flutter_devicon/flutter_devicon.dart';
class LanguagesList {
  final List<Map<String, dynamic>> languages = [
    {'name': 'JavaScript', 'icon': FlutterDEVICON.javascript_plain},
    {'name': 'Python', 'icon': FlutterDEVICON.python_plain},
    {'name': 'Java', 'icon': FlutterDEVICON.java_plain},
    {'name': 'C++', 'icon': FlutterDEVICON.cplusplus_plain},
    {'name': 'Swift', 'icon': FlutterDEVICON.swift_plain},
    {'name': 'Ruby', 'icon': FlutterDEVICON.ruby_plain},
    {'name': 'C#', 'icon': FlutterDEVICON.csharp_line}, // Add: C#
    {'name': 'Dart Flutter', 'icon': FlutterDEVICON.flutter_plain}, // Add: Dart
    {'name': 'Kotlin', 'icon': FlutterDEVICON.kotlin_plain}, // Add: Kotlin
    {'name': 'Vue.js', 'icon': FlutterDEVICON.vuejs_plain}, // Add: Vue.js
    {'name': 'React', 'icon': FlutterDEVICON.react_original}, // Add: React
  ];
  
  List<Map<String, dynamic>> get _languages => languages;
}
