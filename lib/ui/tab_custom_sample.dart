import 'package:flutter/material.dart';
import 'tabs_sample.dart';

class TabCustomSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          bottom: TabBar(
            indicator: CustomIndicator() ,
            tabs: [
              Tab(text: "Sign"),
              Tab(text: "Signup"),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: <Widget>[
              Text("Sign", style: TextStyle(fontSize: 25.0)),
              Text("SignUP", style: TextStyle(fontSize: 25.0)),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIndicator extends Decoration{
  
  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _CustomPainter(this,onChanged);
  }
}
class _CustomPainter extends BoxPainter{
 
  _CustomPainter(this.decoration, VoidCallback onChanged):assert(decoration != null),super(onChanged);

  final Decoration decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    final Rect rect = offset & configuration.size;
    final Paint paint = Paint();
    paint.color = Colors.grey[600];
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(32.0)), paint);
   }

}
