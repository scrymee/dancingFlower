import 'package:flutter/material.dart';
//Flutterのウィジェットを使いますという宣言

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  //Widget build() return の中には最初に絶対書くもの
  Widget build(BuildContext context) {
    //buildした後は、Widgetのインスタンスを返す。
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyTestApp(),
    );
  }
}


class MyTestApp extends StatefulWidget{
  @override
  _MyTestAppState createState() => _MyTestAppState();
}

class _MyTestAppState extends State<MyTestApp>{
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




//ここまで自作前

//statefulWidgetの指定。classはWidgetをBuildしたときに読み込まれるもの
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  //ここでは、State（変数？phpのセッション的なイメージ）を絶対に宣言してあげる。
  //また、このclass自体はウィジェットになり、動的な操作はMyHomePageStateメソッドが担う
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    //このsetStateはStatefulウィジェットには必須。変数などの変更を記録するためのもの。
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        //ここで、数字の増加をどういう風なウィジェットをどうしたら動くかを指定する
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
