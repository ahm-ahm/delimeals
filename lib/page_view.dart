import 'package:flutter/material.dart';
class Pages extends StatefulWidget {
  

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
final PageController controller = PageController();

final currentPageValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
//       child: PageView(
//   children: <Widget>[
//     Container(
//       color: Colors.pink,
//     ),
//     Container(
//       color: Colors.cyan,
//     ),
//     Container(
//       color: Colors.deepPurple,
//     ),
//   ],
//   scrollDirection: Axis.vertical,
// ),

//-----------to create undefined list
// child: PageView.builder(itemBuilder: (builder,position){
//   return Container(color: position % 2 == 0 && position % 3==0 ? Colors.pink:Colors.yellow,);
// }),
//     );
//   }

///----PageSnapping flag=>not scroll to an integer position and behave like a normal ListView.--------------------------------------
   
   
   //PageController : a variable which holds the value of the currentPage.
   
   child:PageView.builder(
     
    
  controller: controller,
  itemBuilder: (context, position) {
    if (position == currentPageValue.floor()) {
     
      return Transform(
        transform: Matrix4.identity()..rotateX(currentPageValue - position),
        child: Container(
          color: position % 2 == 0 ? Colors.blue : Colors.pink,
          child: Center(
            child: Text(
              "Page$position",
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
          ),
        ),
      );
    }  else {
      return Container(
        color: position % 2 == 0 ? Colors.blue : Colors.pink,
        child: Center(
          child: Text(
            "Page",
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
      );
    }
  },
  itemCount: 10,
) );
}}
