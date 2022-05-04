import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Entry {
  final String title;
  final List<Entry> children;
  Entry(this.title, [this.children = const <Entry>[]]);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: 500,
            margin: EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      'assets/images/mw_1.png',
                    ))),
          ),
          Container(
            margin: EdgeInsets.only(top: 230, right: 50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      'assets/images/mw_2.png',
                    ))),
          ),
          //Container(
          //margin: EdgeInsets.only(top: 295),
          //decoration: BoxDecoration(
          //image: DecorationImage(
          //alignment: Alignment.topCenter,
          //image: AssetImage(
          //'assets/images/mw_2.png',
          //))),
          //),
          Container(
            margin: EdgeInsets.only(top: 535, right: 50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      'assets/images/mw_2.png',
                    ))),
          ),
          Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 130),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Имя Фамилия',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('+7 747 123 45 67'),
                          Padding(
                            padding: EdgeInsets.only(left: 170),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text('12   '),
                                      Text('23   '),
                                      Text('56   '),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 64,
            width: 100,
            margin: EdgeInsets.only(left: 150, top: 60),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      'assets/images/icon_for_main.png',
                    ))),
          ),
          Container(
            padding: EdgeInsets.only(top: 245, left: 20),
            child: Column(
              children: <Widget>[
                Text(
                  'Редактировать профиль',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 245, left: 250),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      'assets/images/set.png',
                    ))),
          ),
          Container(
            margin: EdgeInsets.only(top: 60, left: 280),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      'assets/images/vec.png',
                    ))),
          ),
          //Container(
          //padding: EdgeInsets.only(top: 310, left: 55),
          //child: Column(
          //children: <Widget>[
          //Text(
          //'Мои отзывы(35)',
          //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //),
          //],
          //),
          //),
          //Container(
          //margin: EdgeInsets.only(top: 315, left: 280),
          //decoration: BoxDecoration(
          //image: DecorationImage(
          //alignment: Alignment.topCenter,
          //image: AssetImage(
          //'assets/images/mec.png',
          //))),
          //),
          Container(
            padding: EdgeInsets.only(top: 550, left: 20),
            child: Column(
              children: <Widget>[
                Text(
                  'Мои фото(10)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 560, left: 250),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      'assets/images/mec.png',
                    ))),
          ),
          Container(
            margin: EdgeInsets.only(top: 600),
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      'assets/images/2-items.png',
                    ))),
          ),
          Container(
            margin: EdgeInsets.only(top: 270),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) =>
                  EntryItem(data[index]),
            ),
          )
        ],
      ),
    );
  }

  final List<Entry> data = <Entry>[
    Entry('Мои отзывы', <Entry>[
      Entry('Опубликовано', <Entry>[
        Entry('Арман'),
      ]),
      Entry('Опубликовано', <Entry>[
        Entry('Арман'),
      ]),
      Entry('В обработке', <Entry>[
        Entry('Жаксыбай'),
      ]),
      Entry('Отказано', <Entry>[
        Entry('Аружан'),
      ]),
    ])
  ];
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
