import 'package:flutter/material.dart';

class TextFieldWithBoxShadow extends StatelessWidget {
  final String? errorText;
  final String? labelText;
  final TextEditingController? controller;
  final double height;
  final double width;

  const TextFieldWithBoxShadow({
    Key? key,
    this.errorText,
    this.labelText,
    this.controller,
    this.height = 50,
    this.width = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorStyle = const TextStyle(
      fontSize: 14,
    );

    // Wrap everything in LayoutBuilder so that the available maxWidth is taken into account for the height calculation (important if you error text exceeds one line)
    return LayoutBuilder(builder: (context, constraints) {
      // Use tp to calculate the height of the errorText
      final textPainter = TextPainter()
        ..text = TextSpan(text: errorText, style: errorStyle)
        ..textDirection = TextDirection.ltr
        ..layout(maxWidth: constraints.maxWidth);

      final heightErrorMessage = textPainter.size.height + 8;
      return Stack(
        children: [
          // Separate container with identical height of text field which is placed behind the actual textfield
          Container(
            height: height,
            width: width,
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.07,
            ),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  offset: Offset(3, 3),
                ),
              ],
              // borderRadius: BorderRadius.circular(
              //   20.0,
              // ),
            ),
          ),
          Container(
            // Add height of error message if it is displayed
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.08,
            ),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(
            //     20,
            //   ),
            // ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(
                //     20.0,
                //   ),
                // ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: labelText,
                border: InputBorder.none,
              ),
              controller: controller,
            ),
          ),
        ],
      );
    });
  }
}
