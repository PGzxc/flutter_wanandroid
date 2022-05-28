import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget {
  const TabDemo({Key? key}) : super(key: key);

  @override
  State<TabDemo> createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> with TickerProviderStateMixin {
  late TabController tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.transparent,
          labelPadding: const EdgeInsets.only(bottom: 20),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            _CustomTab(
              isSelected: _selectedIndex == 0,
            ),
            _CustomTab(
              isSelected: _selectedIndex == 1,
            ),
            _CustomTab(
              isSelected: _selectedIndex == 2,
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text("person 1")),
          Center(child: Text("person 2")),
          Center(child: Text("person 3")),
        ],
      ),
    );
  }
}

class _CustomTab extends StatelessWidget {
  final bool isSelected;

  const _CustomTab({
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tab(
            icon: Icon(
              Icons.person,
              size: 30,
              color: isSelected ? Colors.black : Colors.grey,
            )),
        Container(
          width: 100,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    );
  }
}