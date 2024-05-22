import 'package:flutter/material.dart';

class TransparentButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool isSelected;

  TransparentButton({
    required this.onPressed,
    required this.child,
    this.isSelected = false,
  });

  @override
  _TransparentButtonState createState() => _TransparentButtonState();
}

class _TransparentButtonState extends State<TransparentButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.isSelected ? Colors.orange.withOpacity(0.3) : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 30.0,
          width: 100.0,
        ),
        Container(
          height: 3.0,
          width: 87.0,
          color: widget.isSelected ? Colors.orange : Colors.transparent,
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onPressed,
              borderRadius: BorderRadius.circular(10.0),
              child: Center(
                child:
                  widget.child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
