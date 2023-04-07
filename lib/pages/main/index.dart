import 'package:flutter/material.dart';
import 'package:mi_pos/pages/main/menu.dart';
import 'package:mi_pos/themes.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: darkColor),
            borderRadius: borderRadius(50),
          ),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Cari menu',
              prefixIcon: Icon(Icons.search_outlined),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            MenuSection(),
          ],
        ),
      ),
    );
  }
}
