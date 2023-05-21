import 'package:flutter/material.dart';
import 'package:flutter_hci/main.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
              child: SearchBox(
                onTextChanged: (text) {
                  print('Search text changed: $text');
                }
              ),
            ),
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
      onTapOutside: (e) {
        Navigator.pop(context);
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

