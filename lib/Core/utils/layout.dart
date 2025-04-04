import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Features/from me/presentation/views/from_me_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/home/presentation/views/widgets/custom_floating_action_button.dart';
import '../../Features/shipments/presentation/views/shipments_view.dart';
import '../../Features/to me/presentation/views/to_me_view.dart';
import '../../constants.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const ShipmentsView(),
    const FromMeView(),
    const ToMeView(),
  ];

  void _onTab(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  Widget _buildBottomNavItem({
    required String image,
    required String label,
    double? size = 24,
    required int index,
  }) {
    final bool isSelected = _pageIndex == index;
    final Color color = isSelected ? kPrimaryColor : Colors.grey;
    return InkWell(
      onTap: () => _onTab(index),
      child: SizedBox(
        width: 70,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image, height: size, color: kPrimaryColor),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: color, fontSize: 12))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _pageIndex,
        children: _pages,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {},
        size: 60,
        iconSize: 30,
        color: kPrimaryColor,
      ),
      bottomNavigationBar: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: BottomAppBar(
          clipBehavior: Clip.none,
          color: Colors.white,
          surfaceTintColor: Colors.black,
          elevation: 0,
          // notchMargin: 6.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(
                  image: 'assets/icons/icon_home_.svg',
                  label: 'Home',
                  index: 0),
              _buildBottomNavItem(
                  image: 'assets/icons/icon_shipments.svg',
                  label: 'Shipments',
                  size: 20,
                  index: 1),
              const SizedBox(width: 48),
              _buildBottomNavItem(
                  image: 'assets/icons/from_me.svg',
                  label: 'From Me',
                  index: 2),
              _buildBottomNavItem(
                  image: 'assets/icons/to_me.svg', label: 'To Me', index: 3),
            ],
          ),
        ),
      ),
    );
  }
}
