import 'package:flutter/material.dart';
import 'package:flutter_hci/search.dart';
import 'package:flutter_hci/word_detail.dart';

const Color themeColor = Color.fromRGBO(32, 226, 111, 1.0);

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (var i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

void main() => runApp(MaterialApp(
    title: 'Naver Dictionary HCI',
    theme: ThemeData(primarySwatch: createMaterialColor(themeColor)),
    home: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '로그인',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('My Menu'),
                      ListTile(
                        title: const Text('영어 공부'),
                        onTap: () {
                          // Handle 영어 공부 tap
                        },
                      ),
                      const Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: const Text('단어장'),
                        onTap: () {
                          // Handle 단어장 tap
                        },
                      ),
                      const Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: const Text('파파고'),
                        onTap: () {
                          // Handle 파파고 tap
                        },
                      ),
                      const Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: const Text('네이버 앱'),
                        onTap: () {
                          // Handle 네이버 앱 tap
                        },
                      ),
                      const Divider(
                        height: 1,
                      ),
                      ListTile(
                        title: const Text('속담, 퀴즈'),
                        onTap: () {
                          // Handle 속담, 퀴즈 tap
                        },
                      ),
                    ]),
                onTap: () {
                  // Handle My Menu tap
                },
              ),
              ListTile(
                title: const Text('고객센터'),
                onTap: () {
                  // Handle 고객센터 tap
                },
              ),
              ListTile(
                title: const Text('알림설정'),
                onTap: () {
                  // Handle 알림설정 tap
                },
              ),
              ListTile(
                title: const Text('앱설정'),
                onTap: () {
                  // Handle 앱설정 tap
                },
              ),
            ],
          ),
        ),
        body: const MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class Item {
  final int widthFactor;
  final int heightFactor;
  final Text name;

  Item(this.widthFactor, this.heightFactor, this.name);
}

class _MainScreenState extends State<MainScreen> {
  bool isMenuVisible = false;

  double get containerHeight => isMenuVisible ? 300.0 : 0.0;

  List<Item> items = [
    Item(1, 1, const Text("국어사전")),
    Item(1, 1, const Text("영한사전")),
    Item(1, 1, const Text("영영사전")),
    Item(1, 1, const Text("일본어")),
    Item(1, 1, const Text("중국어")),
    Item(1, 1, const Text("스페인어")),
    Item(1, 1, const Text("프랑스어")),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SearchPanel(),
        GestureDetector(
          onVerticalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! > 0) {
              setState(() {
                isMenuVisible = true;
              });
            } else if (details.primaryVelocity! < 0) {
              setState(() {
                isMenuVisible = false;
              });
            }
          },
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: containerHeight,
          child: Container(
            color: Colors.black87,
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Change the crossAxisCount as needed
                childAspectRatio: 2, // Initial aspect ratio (width / height)
              ),
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];

                return GridTile(
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    width: double.infinity,
                    height: double.infinity,
                    child: AspectRatio(
                        aspectRatio: item.widthFactor / item.heightFactor,
                        child: ElevatedButton(
                          onPressed: () {
                            debugPrint('ElevatedButton Clicked');
                          },
                          child: items[index].name,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(64)),
                            backgroundColor: Colors.grey.withOpacity(0.7),
                          ),
                        )),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SearchPanel extends StatefulWidget {
  const SearchPanel({Key? key}) : super(key: key);

  @override
  State<SearchPanel> createState() => _SearchPanelState();
}

class _SearchPanelState extends State<SearchPanel> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Theme.of(context).primaryColor,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              padding: const EdgeInsets.only(bottom: 250.0),
              child: Stack(alignment: Alignment.center, children: [
                const Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.keyboard_arrow_up, size: 32)),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Builder(builder: (context) {
                          return IconButton(
                            icon: const Icon(Icons.menu, size: 32),
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                          );
                        }))),
              ])),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                '한영사전',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              )),
          Container(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.camera_alt, size: 32),
                    Icon(Icons.mic, size: 32),
                    Icon(Icons.draw, size: 32),
                    Icon(Icons.bookmark, size: 32),
                  ])),
        ]),
      ),
      const Spacer(),
      const Icon(Icons.keyboard_arrow_down, size: 32)
    ]);
  }
}
