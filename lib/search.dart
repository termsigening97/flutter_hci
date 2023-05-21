import 'package:flutter/material.dart';
import 'package:flutter_hci/word_detail.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final entries = [
    'assignment',
    'end-term',
    'human-computer interaction',
    '기말'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          color: Colors.lightBlue,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  '한영사전',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.menu, size: 32),
              )
            ]),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: SearchBox(onTextChanged: (text) {}),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemCount: entries.length,
                itemBuilder: (context, index) => SizedBox(
                    height: 30,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: [
                          const Icon(Icons.history, color: Colors.white70),
                          const SizedBox(width: 10),
                          Text(
                            entries[index],
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white70),
                          )
                        ]))),
                separatorBuilder: (context, index) =>
                    const Divider(height: 10, thickness: 1),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Row(children: [
                  Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Switch(value: true, onChanged: (context) => {})),
                  const Text('추천 검색어 보이기')
                ])),
          ])),
    ]));
  }
}

class SearchBox extends StatefulWidget {
  final void Function(String) onTextChanged;

  const SearchBox({super.key, required this.onTextChanged});

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: _searchController,
      onChanged: widget.onTextChanged,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailedScreen()));
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
    );
  }
}
