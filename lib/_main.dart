import 'package:flutter/material.dart';
//Flutterのウィジェットを使いますという宣言

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //buildした後は、Widgetのインスタンスを返す。
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter  カウントアプリですよ'),
      //homeには、そのままテキストなどのウィジェットを書いても良い。その場合、ステーとレスウィジェットが完成
      //この例の場合は、MyHomePageというメソッドに飛ばしている
      //これで、ステートフルなウィジェットを再度呼び出すことでカウント機能を実現
      //ここのhomeでの返り値はscaffoldでないとダメ
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
      body: Center(
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'あなたはボタンを何回押しましたか？',
            ),

            Card(child: ListTile(title: Text('One-line ListTile'))),
            Card(child: ListTile(title: Text('One-line ListTile'))),
            Card(child: ListTile(
              title: Text('One-line ListTile'),
              subtitle: Text('テストテスト'),
            )),
            Card(child: ListTile(
                title: Text('One-line ListTile'),
              subtitle: Text('テストテスト'),
            )),
            Card(
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('One-line with both widgets'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),

            Card(
              child: Column(
                children: <Widget>[
                  Image.network("https://placehold.jp/150x150.png"),
                  Container(
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text("a"),
                        leading: Icon(Icons.person),
                        subtitle: Text("サブタイトル"),
                      )),
                ],
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.network("https://placehold.jp/150x150.png"),
                  Container(
                      margin: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                        Text('ほげほげ'),
                          ]
                      )
                      )
                ],
              ),
            ),
          ],
        ),
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
