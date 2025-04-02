import 'package:flutter/material.dart';

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
    required IconData icon,
    required String label,
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
            Icon(icon, color: color, size: 24),
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
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(icon: Icons.home, label: 'Home', index: 0),
            _buildBottomNavItem(
                icon: Icons.local_shipping, label: 'Shipments', index: 1),
            const SizedBox(width: 48),
            _buildBottomNavItem(
                icon: Icons.download, label: 'From Me', index: 2),
            _buildBottomNavItem(
                icon: Icons.upload_rounded, label: 'To Me', index: 3),
          ],
        ),
      ),
    );
  }
}
