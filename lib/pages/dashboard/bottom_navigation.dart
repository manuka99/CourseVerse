import 'package:course_app/common/custom_colors.dart';
import 'package:course_app/pages/monitor/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatefulWidget {
  late int selectedIndex;
  late void Function(int) onTap;

  AppBottomBar({required this.selectedIndex, required this.onTap});

  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  // late ScrollController _scrollController;
  // late double _containerMaxHeight = 56, _offset, _delta = 0, _oldOffset = 0;

  @override
  void initState() {
    super.initState();
    // _offset = 0;
    // _scrollController = ScrollController()
    //   ..addListener(() {
    //     print("sdsdsdsd");
    //     setState(() {
    //       double offset = _scrollController.offset;
    //       _delta += (offset - _oldOffset);
    //       if (_delta > _containerMaxHeight)
    //         _delta = _containerMaxHeight;
    //       else if (_delta < 0) _delta = 0;
    //       _oldOffset = offset;
    //       _offset = -_delta;
    //     });
    //   });
  }
  //
  // @override
  // Widget build(BuildContext context) {
  //   int _selectedIndex = widget.selectedIndex;
  //   void Function(int) _onItemTapped = widget.onTap;
  //
  //   return LayoutBuilder(
  //     builder: (context, constraints) {
  //       return Stack(
  //         alignment: Alignment.bottomCenter,
  //         children: <Widget>[
  //           ListView.builder(
  //             physics: NeverScrollableScrollPhysics(),
  //             controller: _scrollController,
  //             itemCount: 10,
  //             itemBuilder: (context, index) => Container(
  //                 width: MediaQuery.of(context).size.width,
  //                 height: MediaQuery.of(context).size.height - _containerMaxHeight,
  //                 child: Monitor()),
  //           ),
  //           Positioned(
  //             bottom: _offset,
  //             width: constraints.maxWidth,
  //             child: Container(
  //               width: double.infinity,
  //               color: Colors.white,
  //               height: _containerMaxHeight,
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: <Widget>[
  //                   _buildItem(Icons.home, "Home"),
  //                   _buildItem(Icons.blur_circular, "Collection"),
  //                   _buildItem(Icons.supervised_user_circle, "Community"),
  //                   _buildItem(Icons.notifications, "Notifications"),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  //
  // Widget _buildItem(IconData icon, String title) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Icon(icon, size: 28),
  //       Text(title, style: TextStyle(fontSize: 10)),
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = widget.selectedIndex;
    void Function(int) _onItemTapped = widget.onTap;

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.monitor),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'User',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: CustomColors.iconNotSelected,
      selectedItemColor: CustomColors.iconSelected,
      onTap: _onItemTapped,
    );
  }

}
