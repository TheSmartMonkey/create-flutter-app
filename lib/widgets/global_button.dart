import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function onAction;
  final String textButton;
  final FocusNode? focusNode;

  const CustomButton({
    Key? key,
    required this.onAction,
    required this.textButton,
    this.focusNode,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool spinner = true;

  @override
  void initState() {
    setState(() {
      spinner = false;
    });
    super.initState();
  }

  Future<void> onPressed() async {
    setState(() {
      spinner = true;
    });
    await widget.onAction();
    setState(() {
      spinner = false;
    });
  }

  Widget spinnerWidget(Color color) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        color: color,
        strokeWidth: 1.5,
      ),
    );
  }

  Widget innerTextWidget() {
    return Text(
      widget.textButton,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Center(
      child: ElevatedButton(
        focusNode: widget.focusNode,
        onPressed: () => spinner ? null : onPressed(),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, shape: const StadiumBorder(),
          minimumSize: Size(screenSize.width - 100, 60),
          backgroundColor: Colors.pink,
        ),
        child: spinner ? spinnerWidget(Colors.white) : innerTextWidget(),
      ),
    );
  }
}
