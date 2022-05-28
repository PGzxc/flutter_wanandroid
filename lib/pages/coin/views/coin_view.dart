import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabBar();
}

class _TabBar extends State<TabBarDemo> with SingleTickerProviderStateMixin{
  final List<String> _tabValues = [
    '语文',
    '英语',
    '化学',
    '物理',
    '数学',
    '生物',
    '体育',
    '经济',
  ];

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
        bottom: TabBar(
          tabs: _tabValues.map((f) {
            return Text(f);
          }).toList(),
          controller: _controller,
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorWeight: 5.0,
          labelStyle: TextStyle(height: 2),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabValues.map((f) {
          return Center(
            child: Text(f),
          );
        }).toList(),
      ),
    );
  }
}

