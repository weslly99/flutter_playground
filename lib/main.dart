import 'package:flutter/material.dart';
import 'values.dart';
import 'sampleItem.dart';
import 'model/sample_name.dart';
import 'ui/tab_custom_sample.dart';
import 'ui/appbar_sample.dart';
import 'ui/tabs_sample.dart';
import 'ui/navigator_sample.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Apercu',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String,WidgetBuilder>{
        Values.appBarSampleRoute: (BuildContext context)=> AppBarSample(),
        Values.tabsSampleRoute: (BuildContext context)=> TabsSample(),
        Values.tabCustomSampleRoute: (BuildContext context)=> TabCustomSample(),
        Values.navigatorCustomSampleRoute: (BuildContext context)=> NavigatorSample(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget{

  MyHomePage({Key key, this.title}):super(key:key);

  final String title;

  @override
  State<StatefulWidget> createState() =>MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index)=>
            SampleItem(title:itens[index].name,route:"/${itens[index].name}"),
        itemCount: itens.length,
      ),
    );
  }
}

final List<SampleName> itens = <SampleName>[
  SampleName(name: 'App Bar'),
  SampleName(name: 'Tabs'),
  SampleName(name: 'Tab Custom'),
  SampleName(name: 'Navigator')
];