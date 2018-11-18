import 'package:flutter/material.dart';
import '../values.dart';

class AppBarSample extends StatelessWidget {
  static const String _BACK_BUTTON_MSG = 'Back button is clicked';
  static const String _SEARCH_BUTTON_MSG = "Search button is clicked";
  static const String _SETTINGS_BUTTON_MSG = "Settings button is clicked";
  static const String _STAR_BUTTON_MSG = "Star button is clicked";

  static const List<String> OPTIONS = [
    'perfil',
    'settings',
    'sign out',
  ];

  AppBarSample({Key key, this.title = 'Default Appbar'}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(this.title),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          /*
          * Por padrão o flutter oferece um leading para paginas secundarias,
          * com a funçao de Navigator.pop(context), que remove a tela atual da
          * pilha de telas e retorna para tela principal. Para alterar esse
          * comportamento podemos sobrescrever o leading.
          *
          * */
          Container(
            margin: EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: AppBar(
              title: Text('Title'),
              backgroundColor: Colors.orange,
              elevation: 4.0,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  tooltip: 'Back',
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),

          /*
          * Para criar botões de ações visiveis basta colocar em actions
          *
          * */
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: AppBar(
              title: Text('Appbar actions'),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    key.currentState
                        .showSnackBar(_showSnackBar(_BACK_BUTTON_MSG));
                  }),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      key.currentState
                          .showSnackBar(_showSnackBar(_SEARCH_BUTTON_MSG));
                    }),
                IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      key.currentState
                          .showSnackBar(_showSnackBar(_SETTINGS_BUTTON_MSG));
                    })
              ],
            ),
          ),

          //Centralizando o titulo no AppBar
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: AppBar(
              title: Text('Center'),
              centerTitle: true,
            ),
          ),

          //Appbar com diferente Thema
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: AppBar(
              title: Text('Appbar icon and Text Theme'),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {
                      key.currentState
                          .showSnackBar(_showSnackBar(_STAR_BUTTON_MSG));
                    })
              ],
              textTheme:
                  TextTheme(title: TextStyle(color: Colors.deepPurple[400])),
              iconTheme: IconThemeData(color: Colors.deepPurple[600]),
              backgroundColor: Colors.cyan[200],
            ),
          ),

          /* Popup menu
           * utilizando uma lista de opções é capaz de fazer um popupMenuButton e
           * definir uma regra para cada opção selecionado com o metodo onSelected
           * que passará o valor do item selecionado para o metodo. Cada Item tem
           * seu valor setado na opção value do PopupMenuItem
           * */
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: AppBar(
              title: Text('Popup menu'),
              actions: <Widget>[
                PopupMenuButton<String>(
                    tooltip: 'Popup menu',
                    onSelected: _choiseAction,
                    itemBuilder: (BuildContext context) {
                      return OPTIONS.map((String opt) {
                        return PopupMenuItem<String>(
                          value: opt,
                          child: Text(opt),
                        );
                      }).toList();
                    }),
              ],
            ),
          ),

          //Titulo e subtitulo
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: AppBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    "Subtitle",
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ),

          //image and Title
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: AppBar(
              elevation: 4.0,
              textTheme: TextTheme(title: TextStyle(color: Colors.black)),
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset(
                    Values.imageArrowRight,
                    width: 64.0,
                  ),
                  Text("Title",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
                  Image.asset(
                    Values.imageArrowLeft,
                    width: 64.0,
                  ),
                ],
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: AppBar(
              toolbarOpacity: 0.5,
              title: Text("Opacity 50%"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0, bottom: 32.0),
            child: AppBar(
             backgroundColor: Colors.transparent,
              title: Text("Trasparent"),
            ),
          )


        ],
      ),
    );
  }

  SnackBar _showSnackBar(String msg) {
    return SnackBar(content: Text(msg));
  }

  //define qual item foi clicado no popupmenu
  void _choiseAction(String opt) {
    print(opt);
  }
}
