import 'package:flutter/material.dart';
class SampleItem extends StatelessWidget {
  SampleItem({this.title, this.route});

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: Colors.lightGreen,width: 4.0))
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(route);
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,color: Colors.grey[800]),
              ),
              Icon(Icons.keyboard_arrow_right,color: Colors.grey[800],)
            ],
          ),
        ),
      ),
    );
  }


}
