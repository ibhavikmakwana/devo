import 'package:devo/module/home/widget/list_item_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (_, index) {
          return Divider();
        },
        itemBuilder: (_, index) {
          return ListItemWidget(
            currentIndex: index,
            totalCount: 10,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
