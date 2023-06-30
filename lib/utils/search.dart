import 'package:flutter/material.dart';

class SearchBarLang extends StatelessWidget {
final controller;

  SearchBarLang({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
                            controller: controller,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Поиск',
                            ),
                          );
  }
}
