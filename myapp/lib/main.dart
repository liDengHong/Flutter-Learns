import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WordPair = new prefix0.WordPair.random();
    return new MaterialApp(
theme: new ThemeData(
  primaryColor: Colors.blueGrey,
),
color: Colors.black,
    home: new RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
 createState() => new RandomWordsState();
}

class  RandomWordsState extends State<RandomWords> {
@override
final _suggestions = <WordPair>[];
final _biggerFont = const TextStyle(fontSize: 18.0);
final _saved = new Set<WordPair>();
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('你是大傻叉'),
       actions: <Widget>[
          new IconButton(icon: new Icon(Icons.linked_camera), onPressed: _pushSaved),
        ],
      ),
      // body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
  Navigator.of(context).push(
    new MaterialPageRoute(
      builder: (context) {
        final tiles = _saved.map(
          (pair) {
            return new ListTile(
              title: new Text(
                pair.asPascalCase,
                style: _biggerFont,
              ),
            );
          },
        );
        final divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles,
          )
          .toList();

        return new Scaffold(
          appBar: new AppBar(
            title: new Text('list'),
          ),
          body: new ListView(children: divided),
        );
      },
    ),
  );
}

Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        // 在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) return new Divider(
          height: 5,
          color: Color(0xFFFF90345),
          indent: 10,
          endIndent: 10,
        );
        final index = i ~/ 2;
        // 如果是建议列表中最后一个单词对
        if (index >= _suggestions.length) {
          // ...接着再生成10个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
  
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
       alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if(alreadySaved) {
            _saved.remove(pair);
          }else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
