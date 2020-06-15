import 'package:flutter/material.dart';

class CalcTextField extends StatefulWidget {
  final String hintText;
  final bool number;
  final TextEditingController _controller = TextEditingController();

  String value() {
    return _controller.text;
  }

  CalcTextField({this.hintText, this.number});

  @override
  _CalcTextFieldState createState() => _CalcTextFieldState();
}

class _CalcTextFieldState extends State<CalcTextField> {
  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      child: TextFormField(
        keyboardType: widget.number ? TextInputType.number : TextInputType.text,
        controller: widget._controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
