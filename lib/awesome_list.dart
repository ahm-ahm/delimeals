import 'package:flutter/material.dart';

class AwesomeList extends StatelessWidget {
  final String month;
  AwesomeList({Key key, this.month}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          month,
        ),
        leading: Icon(
          Icons.date_range,
          color: Colors.green,
        ),
        trailing: Column(
          children: <Widget>[
            Icon(
              Icons.thumbs_up_down,
              color: Colors.yellowAccent,
            ),
            Icon(Icons.chat_bubble_outline, color: Colors.green),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.pinkAccent)],
      ),
    );
  }
}
