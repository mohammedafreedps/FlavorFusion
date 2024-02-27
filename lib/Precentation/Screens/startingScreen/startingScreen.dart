
import 'package:flavorfusion/Constants/colors.dart';
import 'package:flavorfusion/Precentation/Screens/createScreen/createPageUI.dart';
import 'package:flavorfusion/Precentation/Screens/discoverScreen/discoverScreenUI.dart';
import 'package:flavorfusion/Precentation/Screens/homeScreen/homeScreenUI.dart';
import 'package:flavorfusion/Precentation/Screens/profileScreen/profileScreenUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StartingScreenUI extends StatefulWidget {
  const StartingScreenUI({super.key});

  @override
  State<StartingScreenUI> createState() => _StartingScreenUIState();
}
class _StartingScreenUIState extends State<StartingScreenUI> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    const HomeScreenUI(),
    DiscoverScreenUI(),
    const CreatePageUI(),
    ProfileScreenUI()
  ];
  final List<String> _assetPaths = [
    'Assets/house-solid.svg',
    'Assets/bowl-food-solid.svg',
    'Assets/plus-solid.svg',
    'Assets/user-solid.svg',
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: baseColor,
        items: [
        _bottomNavbarItem(screenWidth: _screenSize.width, assetPath: _assetPaths[0], pageIndex: _selectedPageIndex, activateIndex: 0),
        _bottomNavbarItem(screenWidth: _screenSize.width, assetPath: _assetPaths[1], pageIndex: _selectedPageIndex, activateIndex: 1),
        _bottomNavbarItem(screenWidth: _screenSize.width, assetPath: _assetPaths[2], pageIndex: _selectedPageIndex, activateIndex: 2),
        _bottomNavbarItem(screenWidth: _screenSize.width, assetPath: _assetPaths[3], pageIndex: _selectedPageIndex, activateIndex: 3),
      ],
      selectedItemColor: baseColor,
      currentIndex: _selectedPageIndex,
      onTap: _onItemTapped,),
      );
  }
}

BottomNavigationBarItem _bottomNavbarItem({required double screenWidth,required String assetPath,required int pageIndex,required int activateIndex}){
  return BottomNavigationBarItem(icon: SvgPicture.asset(assetPath,width: screenWidth*0.05,height:  screenWidth*0.05,color: pageIndex == activateIndex ? secondaryColor:primaryColor,),label: '');
}