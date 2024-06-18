// ignore_for_file: prefer_const_constructors

import 'package:calc/models/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '123456789';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onHorizontalDragEnd: (details) => {_dragToDelete()},
              child: Text(
                result,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: result.length > 5 ? 60 : 100,
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: _buildButtonsGrid(),
            ),
          ],
        ),
      ),
    );
  }

  void _dragToDelete() {
    // ignore: avoid_print
    print("Delete last digit");
  }

  void _onButtonPressed(String buttonText) {
    print("ButtonText");
  }

  Widget _buildButtonsGrid() {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.zero,
      crossAxisCount: 4,
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        final button = buttons[index];
        return MaterialButton(
          padding: button.value == '0'
              ? EdgeInsets.only(right: 100)
              : EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          color: button.bgColor,
          onPressed: () {
            _onButtonPressed(button.value);
          },
          child: Text(
            button.value,
            style: TextStyle(color: button.fgColor, fontSize: 35),
          ),
        );
      },
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      staggeredTileBuilder: (index) =>
          StaggeredTile.count(buttons[index].value == '0' ? 2 : 1, 1),
    );
  }
}
