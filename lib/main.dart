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

class _MyTestAppState4 extends State<MyTestApp>{
  //Listview.buildは表示画面から随時読み込み、作成を行う。
  //ListView単体はすべて表示なので、動作が重いとき大変

  var listItem = ['こんにちは', 'ありがとう', 'さよなら','またあいましょう','5','6','7','8','9','１９'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Test'),),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black38),
                    ),
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(this.context, MaterialPageRoute(builder: (context) => MyHomePageDetail(title:listItem[index])));
                    },
                    child:_ListImageTile(index),
                  ),
                );
          },
        itemCount: 10,
      ),
    );
  }
}



Widget _ListImageTile(index){
  var listItem = ['こんにちは', 'ありがとう', 'さよなら','またあいましょう','5','6','7','8','9','１９'];
  return Dismissible(
    key: Key(listItem[index]),
    // スワイプ方向がendToStart（画面左から右）の場合のバックグラウンドの設定
    background: Container(color: Colors.red),
    // スワイプ方向がstartToEnd（画面右から左）の場合のバックグラウンドの設定
    secondaryBackground: Container(color: Colors.blue),

    child:Card(
        child:Column(
          children: <Widget>[
            Image.network('https://placehold.jp/550x150.png'),
            SizedBox(width:20.0),
            Container(
                child: ListTile(
                  title:Text('$index'),
                  leading: Icon(Icons.mood),
                  subtitle: Text(listItem[index]),
                )
            )
          ],
        ),
      ),
  );

}

class _MyTestAppState extends State<MyTestApp>{
  //Listview.buildは表示画面から随時読み込み、作成を行う。
  //ListView単体はすべて表示なので、動作が重いとき大変
var _counter = 0;
var _message = '見て！サボテンが踊っているよ。かわいいね';
void _incrementCounter() {
  setState(() {
    _counter++;
  });
  //このsetStateはStatefulウィジェットには必須。変数などの変更を記録するためのもの。
}
void _resetCounter() {
  setState(() {
    _counter = 0;
  });
  //このsetStateはStatefulウィジェットには必須。変数などの変更を記録するためのもの。
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Test'),),
      body:
            Center(
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                 _Message(_counter),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("争う"),
                        onPressed: _incrementCounter,
                        splashColor: Colors.purple,
                      ),
                      SizedBox(
                        width:20.0,
                      ),
                      RaisedButton(
                        child: Text("争いをやめる"),
                        onPressed: _resetCounter,
                        splashColor: Colors.purple,
                      ),
                    ],
                  ),
                ],
              )
            ),
    );
  }
}


Widget _Message(_counter){
  //message = Text('');return messageだとダメだった
  if (_counter > 4){
    return Column(
      children: <Widget>[
        _NoDancingChair(),
        Text(''),
        Text('みんながインターネットで'),
        Text('争ってばかりいるので、'),
        Text('サボテンは踊るのをやめてしまいました'),
        Text('お前のせいです'),
        Text('あ〜あ'),
        Text(''),
      ],
    );
  }
  return Column(
    children: <Widget>[
      _DancingChair(),
      Text(''),
      Text('見て！サボテンが踊っているよ。かわいいね'),
      Text(''),
      Text(''),
      Text(''),
      Text(''),
      Text(''),
    ],
  );
}


Widget _DancingChair(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('₍₍⁽⁽',style:TextStyle(
          fontSize:50.0,
          color:Colors.lightGreen
      )),
      Text('🌵',style:TextStyle(
          fontSize:50.0,
          color:Colors.cyan
      )),

      Text('₎₎⁾⁾',style:TextStyle(
          fontSize:50.0,
          color:Colors.lightGreen
      ),
      )
    ],
  );
}


Widget _NoDancingChair(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text('🌵',style:TextStyle(
          fontSize:50.0,
          color:Colors.cyan
      )),
    ],
  );
}





class MyHomePageDetail extends StatefulWidget {
  //遷移した時の値を受け取る
  final String title;
  MyHomePageDetail({Key key, this.title});
  //ここまで
  @override
  _MyHomePageDetailState createState() => new _MyHomePageDetailState(title);
}


class _MyHomePageDetailState extends State<MyHomePageDetail> {
  _MyHomePageDetailState(this.title);
  final String title;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Material App"),
        ),
        body: Center(
          child: Text("画面遷移できました$title"),
        ));
  }
}









//接頭語Widgetは、PHPでいうメソッド。public function 的な。classではなくて
//分離したWidgetですよという宣言
Widget _AppTitle() {
  return Padding(
    //EdgeInsetsは上下左右にどれくらいのpaddingを持たせるか。小数点１まで指定
    padding: EdgeInsets.only(bottom: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.mood),
        //Sizedboxは余白。幅５の余白ができている。Widgetをラップすると大きさを指定
        SizedBox(
          width:5.0,
        ),
        Text('あなたの日付を計算します',
          style:  TextStyle(fontSize: 16.0),
        )
      ],
    )
  );
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
