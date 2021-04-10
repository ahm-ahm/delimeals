import 'package:flutter/material.dart';

class AwesomeList2 extends StatelessWidget {
  final String month;
  AwesomeList2({Key key, this.month}) : super(key: key);
  Widget container(Color color) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/b.jpg'),
              repeat: ImageRepeat.repeatY),
          color: Colors.yellowAccent,
          boxShadow: [
            BoxShadow(
              color:color,
              offset: Offset(15.0, -15.0),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 15,
          child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 100.0),
            child: Container(
              // child: ListTile(
              //   title: Text(
              //     month,
              //   ),
              //   // leading: Icon(Icons.date_range,color: Colors.green,),
              //   trailing: Column(
              //     children: <Widget>[
              //       Icon(
              //         Icons.thumbs_up_down,
              //         color: Colors.yellowAccent,
              //       ),
              //       Icon(Icons.chat_bubble_outline, color: Colors.green),
              //     ],
              //   ),
              // ),
              child: Column(
                children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(left:8.0,top: 8.0),
                   child: Text('This is awesome design',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                 ), Padding(
                   padding: const EdgeInsets.only(left:8.0,top: 8.0),
                   child: Text('This is text style description',style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                 ), Padding(
                   padding: const EdgeInsets.only(left:8.0,top: 15.0),
                   child: Text('This is awesome UI',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.bold),),
                 )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.pinkAccent)],
              ),
            ),
          ),
          Container(
            child: container(Colors.cyan),
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.topRight,
          ),
        ],
      ),
    );
  }
}
