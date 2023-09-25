import 'package:flutter/material.dart';

import '../res/my_colors.dart';
import '../res/custom_textstyles.dart';
import 'custom_animated_container.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final GestureTapCallback? onPressed;
  final bool loading;
  final double width;
  final double height;
  final Color color;
  final bool isDisabled;
  final Color? textColor;

  const CustomButton({
    super.key,
    this.textColor,
    required this.text,
    this.onPressed,
    required this.color,
    this.loading = false,
    this.width = 0.0,
    this.height = 64.0,
    this.isDisabled = false,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.color;
  }

  @override
  void didUpdateWidget(_) {
    color = widget.color;
    super.didUpdateWidget(_);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 2000),
      height: widget.height,
      width:
          widget.width > 0 ? widget.width : MediaQuery.of(context).size.width,
      child: !widget.isDisabled
          ? CustomAnimationContainer(
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    color = widget.color == Colors.transparent
                        ? Colors.grey.withOpacity(0.1)
                        : widget.color.withOpacity(0.9);
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    color = widget.color;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    color = widget.color;
                  });
                },
                onTap: widget.onPressed,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  alignment: Alignment.center,
                  child: widget.loading
                      ? CircularProgressIndicator(
                          strokeWidth: 3.0,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            widget.textColor ?? Colors.orange,
                          ),
                        )
                      : Text(
                          widget.text,
                          style: CustomTextStyles.customTextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: widget.textColor ?? MyColors.white,
                          ),
                        ),
                ),
              ),
            )
          : Opacity(
              opacity: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  border: Border.all(
                    color: MyColors.white,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Align(
                  child: Text(
                    widget.text,
                    style: CustomTextStyles.customTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: widget.textColor ?? MyColors.white,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
