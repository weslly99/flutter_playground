import 'package:flutter/material.dart';

class NavigatorSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              scaffoldkey.currentState.openEndDrawer();
            },
          )
        ],
      ),
      drawer: _drawer(),
      endDrawer: _filter(context),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: <Color>[Colors.cyan[400], Colors.purple[500]]),
          ),
          child: Center(
            child: Image.asset(
              'assets/images/nave.png',
              height: 200.0,
            ),
          )),
    );
  }

  Widget _filter(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: DefaultTabController(
        length: 2,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                color: Colors.amber,
                child: TabBar(
                    labelColor: Colors.black,
                    labelStyle: TextStyle(fontWeight: FontWeight.w600),
                    tabs: [Tab(text: 'VALUE'), Tab(text: 'SIZE')]),
              ),
              Container(
                height: 300.0,
                child: TabBarView(
                  children: <Widget>[
                    Container(color: Colors.purple[300]),
                    Container(color: Colors.cyan[300])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
                child: FlutterLogo(), backgroundColor: Colors.white),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Text(
                  "RN",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Text(
                  "AN",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
            accountName: Text("Flutter Example"),
            accountEmail: Text("flutterexample@gmail.com"),
          ),
          ListTile(
          leading: Icon(Icons.alarm),
          title: Text("Alarm"),
         
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text("Search"),
        ),
        ListTile(
          leading: Icon(Icons.security),
          title: Text("Security"),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
        ),
        ],
      ),
    );
  }

}
