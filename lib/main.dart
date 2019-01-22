import 'package:flutter/material.dart';
// import 'package:english_words/english_words.dart';

import 'package:flutterdemo/routes/home.dart';
import 'package:flutterdemo/routes/list.dart';
import 'package:flutterdemo/routes/card.dart';
import 'package:flutterdemo/routes/button.dart';
import 'package:flutterdemo/routes/grid.dart';
import 'package:flutterdemo/routes/drawer.dart';
import 'package:flutterdemo/routes/text.dart';
import 'package:flutterdemo/routes/image.dart';
import 'package:flutterdemo/routes/layout.dart';
import 'package:flutterdemo/routes/transform.dart';
import 'package:flutterdemo/routes/demo/zhihu_mine.dart';
import 'package:flutterdemo/routes/demo/wechat_chatlist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(),
      // initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/list': (context) => ListDemo(),
        '/card': (context) => CardDemo(),
        '/button': (context) => ButtonDemo(),
        '/text': (context) => TextDemo(),
        '/grid': (context) => GridDemo(),
        '/drawer': (context) => DrawerDemo(),
        '/image': (context) => ImageDemo(),
        '/layout': (context) => LayoutDemo(),
        '/transform': (context) => TransformDemo(),
        '/zhihu_mine': (context) => ZhihuMineDemo(),
        '/wechat_chatlist': (context) => WechatChatListDemo(),
      },
    );
  }
}

// class RandomWordsState extends State<RandomWords> {

//   final _suggestions = <WordPair>[];
//   final _savedPairs = new Set<WordPair>();
//   final _biggerFont = const TextStyle(fontSize: 18.0);

//   Widget _buildSuggestions() {
//     return ListView.builder(
//       padding: const EdgeInsets.all(16.0),
//       itemBuilder: (context, i) {
//         if (i.isOdd) return Divider();

//         final index = i ~/ 2;
//         if (index >= _suggestions.length) {
//           _suggestions.addAll(generateWordPairs().take(10));
//         }
//         return _buildRow(_suggestions[index]);
//       },
//     );
//   }

//   Widget _buildRow(WordPair pair) {
//     final bool saved = _savedPairs.contains(pair);
//     return ListTile(
//       title: Text(
//         pair.asPascalCase,
//         style: _biggerFont
//       ),
//       trailing: new Icon(
//         saved ? Icons.favorite : Icons.favorite_border,
//         color: saved ? Colors.red : null
//       ),
//       onTap: () {
//         setState(() {
//           if (saved) {
//             _savedPairs.remove(pair);
//           } else {
//             _savedPairs.add(pair);
//           }
//         });
//       },
//     );

//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Startup Name Generator'),
//         actions: <Widget>[
//           new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved,)
//         ]
//       ),
//       body: _buildSuggestions(),
//     );
//   }

//   void _pushSaved() {
//     Navigator.of(context).push(
//       new MaterialPageRoute<void>(
//         builder: (BuildContext context) {
//           final Iterable<ListTile> tiles = _savedPairs.map(
//             (WordPair pair) {
//               return new ListTile(
//                 title: new Text(pair.asPascalCase, style: _biggerFont)
//               );
//             }
//           );
//           final List<Widget> divided = ListTile.divideTiles(context: context, tiles: tiles).toList();

//           return new Scaffold(
//             appBar: new AppBar(
//               title: const Text('Saved Suggestions'),
//             ),
//             body: new ListView(children: divided)
//           );
//         }
//       )
//     );
//   }
// }

// class RandomWords extends StatefulWidget {

//   @override
//   RandomWordsState createState() => new RandomWordsState();
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
