import 'package:flutter/material.dart';

class CustomStatefulWidget extends StatefulWidget {
  final Color color;
  const CustomStatefulWidget({super.key, required this.color});

  @override
  State<CustomStatefulWidget> createState() => _CustomStatefulWidgetState();
}

class _CustomStatefulWidgetState extends State<CustomStatefulWidget> {
  late Color color;

  @override
  void initState() {
    color = widget.color;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomStatefulWidget oldWidget) {
    if (oldWidget.color != widget.color) {
      color = widget.color;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: widget.color,
    );
  }
}
