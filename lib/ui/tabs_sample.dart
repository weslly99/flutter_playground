import 'package:flutter/material.dart';

class TabsSample extends StatelessWidget {

  final  List<TabModel> tabs = [
    TabModel(text:'Car',icon:Icons.directions_car),
    TabModel(text:'Bike',icon:Icons.directions_bike),
    TabModel(text:'Boat',icon:Icons.directions_boat),
    TabModel(text:'Bus',icon:Icons.directions_bus),
    TabModel(text:'Subway',icon:Icons.directions_subway),
    TabModel(text:'Walk',icon:Icons.directions_walk),
    TabModel(text:'Run',icon:Icons.directions_run),
    TabModel(text:'Transit',icon:Icons.directions_transit),
    TabModel(text:'Railway',icon:Icons.directions_railway),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Title"),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.cyanAccent,
            tabs: tabs.map((tab)=>tabSection(tab)).toList(),
          ),
        ),
        body: TabBarView(
            children: tabs.map((tab)=>tabViewSection(tab)).toList()
        )
      ),
    );
  }

  Widget tabViewSection(TabModel tab) {
    return Icon(
      tab.icon,
      size: 50.0,
    );
  }

  Widget tabSection(TabModel tab) {
    return Column(
      children: <Widget>[
        Icon(tab.icon),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(tab.text),
        )
      ],
    );
  }
}

class TabModel {
  TabModel({this.text, this.icon});

  final String text;
  final IconData icon;
}
