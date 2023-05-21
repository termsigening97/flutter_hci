import 'package:flutter/material.dart';
import 'package:flutter_hci/search.dart';
import 'package:flutter_hci/word_detail.dart';

void main() => runApp(MaterialApp(
    title: 'Naver Dictionary HCI',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
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
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
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
      body: Column(children: [
        Container(
          color: Colors.lightBlue,
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
      ]),
    );
  }
}
