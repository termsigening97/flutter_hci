import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                onTap: () {
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
              ),
            ),
          ]),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('assignment',
                            style: TextStyle(fontSize: 24, color: Colors.cyan)),
                        Row(children: [
                          Text('1. ',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                          Text('명사',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.lightBlueAccent)),
                          Text(' 과제, 임무',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                        ]),
                        Row(children: [
                          Text('2. ',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                          Text('명사',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.lightBlueAccent)),
                          Text(' 배정, 배치',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                        ]),
                        Row(children: [
                          Icon(Icons.multitrack_audio),
                          Text(" 미국 · 영국")
                        ]),
                        Divider(
                          height: 30,
                          thickness: 2,
                        ),
                        Text('assign',
                            style: TextStyle(fontSize: 24, color: Colors.cyan)),
                        Row(children: [
                          Text('1. ',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                          Text('동사',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.lightBlueAccent)),
                          Text(' (일·책임 등을) 맡기다[배정하다/부과하다]',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                        ]),
                        Row(children: [
                          Text('2. ',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                          Text('동사',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.lightBlueAccent)),
                          Text(' 선임하다, 파견하다',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                        ]),
                        Row(children: [
                          Text('3. ',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                          Text('동사',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.lightBlueAccent)),
                          Text(' (사람을) 배치하다',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black87)),
                        ]),
                        Row(children: [
                          Icon(Icons.multitrack_audio),
                          Text(" 미국 · 영국")
                        ]),
                        Divider(
                          height: 30,
                          thickness: 2,
                        ),
                        Text('an assignment man',
                            style: TextStyle(fontSize: 24, color: Colors.cyan)),
                        Text('사회부 취재 기자',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87)),
                        Row(children: [
                          Icon(Icons.multitrack_audio),
                          Text(" 미국 · 영국")
                        ]),
                        Divider(
                          height: 30,
                          thickness: 2,
                        ),
                        Text('give an assignment',
                            style: TextStyle(fontSize: 24, color: Colors.cyan)),
                        Text('숙제를 내주다',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87)),
                        Row(children: [
                          Icon(Icons.multitrack_audio),
                          Text(" 미국 · 영국")
                        ]),
                        Divider(
                          height: 30,
                          thickness: 2,
                        ),
                        Text('address assignment',
                            style: TextStyle(fontSize: 24, color: Colors.cyan)),
                        Text('컴퓨터 번지 지정',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87)),
                        Row(children: [
                          Icon(Icons.multitrack_audio),
                          Text(" 미국 · 영국")
                        ]),
                        Divider(
                          height: 30,
                          thickness: 2,
                        ),
                        Text('assignment key',
                            style: TextStyle(fontSize: 24, color: Colors.cyan)),
                        Text('(전자통신) 지정키, 초인키',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87)),
                        Row(children: [
                          Icon(Icons.multitrack_audio),
                          Text(" 미국 · 영국")
                        ]),
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: const Text('단어 뜻 풀이',
                    style: TextStyle(fontSize: 24, color: Colors.black87)),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: const Text('예시 문구',
                    style: TextStyle(fontSize: 24, color: Colors.black87)),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                child: const Text('반의어, 유의어',
                    style: TextStyle(fontSize: 24, color: Colors.black87)),
              ),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        labelColor: Colors.black38,
        tabs: const [
          Tab(
            text: '단어 / 숙어',
          ),
          Tab(
            text: '뜻풀이',
          ),
          Tab(
            text: '예문',
          ),
          Tab(
            text: '반 / 유의어',
          ),
        ],
      ),
    );
  }
}
