import 'package:flutter/material.dart';
import 'package:flutter_hci/search.dart';

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
                          child: const Icon(Icons.menu, size: 32))),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
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
