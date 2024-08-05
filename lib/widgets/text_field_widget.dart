import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final bool? enabled;
  final TextInputType? keyboardType;
  final String? hinText;
  final String? text;
  final double? width;
  final TextEditingController? controller;
  const TextFieldWidget({super.key, this.width, this.controller, this.text, this.hinText, this.keyboardType, this.enabled});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
        ),
        SizedBox(
          width: widget.width,
          height: 39,
          child: TextField(
            enabled: widget.enabled,
            controller: widget.controller,
            decoration: InputDecoration(
                hintText: widget.hinText,
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                )),
            textInputAction: TextInputAction.done,
            keyboardType: widget.keyboardType,
          ),
        ),
      ],
    );
  }
}
