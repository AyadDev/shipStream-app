import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.size,
    required this.iconSize,
    required this.color,
    this.onPressed,
  });

  final double size;
  final double iconSize;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: color,
      shape: const DiamondBorder(),
      child: InkWell(
        onTap: onPressed ?? () {},
        customBorder: const DiamondBorder(),
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Icon(Icons.add, size: iconSize, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class DiamondBorder extends ShapeBorder {
  const DiamondBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) => const DiamondBorder();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double w = rect.width;
    final double h = rect.height;
    final Path path = Path();
    path.moveTo(w / 2, 0);
    path.lineTo(w, h / 2);
    path.lineTo(w / 2, h);
    path.lineTo(0, h / 2);
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }
}
