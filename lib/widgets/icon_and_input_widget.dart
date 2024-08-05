import 'package:flutter/material.dart';

import '../utils/dimensions.dart';


class IconAndInputWidget extends StatefulWidget {
  final String? hinText;
  final IconData? icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isPasswordType;
  const IconAndInputWidget(
      {Key? key, this.hinText, this.icon, required this.controller, this.keyboardType, this.isPasswordType = false})
      : super(key: key);

  @override
  State<IconAndInputWidget> createState() => _IconAndInputWidgetState();
}

class _IconAndInputWidgetState extends State<IconAndInputWidget> {
  late bool isPasswordType;

  @override
  void initState() {
    super.initState();
    isPasswordType = widget.isPasswordType!;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isPasswordType,
      style: TextStyle(color: Colors.white, fontSize: Dimensions.screenSize(auto: 18), fontFamily: 'Proxima Nova Alt'),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.75))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: Dimensions.screenSize(auto: 2.0), )),
        hintText: widget.hinText,
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.75)),
        prefixIcon: Icon(widget.icon, color: Colors.white.withOpacity(0.75), size: Dimensions.screenSize(auto: 24),),
        suffixIcon:  widget.isPasswordType == true ? IconButton(
                icon: Icon(
                    isPasswordType ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white.withOpacity(0.75)),
                onPressed: () {
                  setState(() {
                    isPasswordType = !isPasswordType;
                  });
                },
              )
            : null,
        filled: false,
      ),
      enableSuggestions: !widget.isPasswordType!,
      autofocus: !widget.isPasswordType!,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.done,
    );
  }

  @override
  void dispose() {
    widget.controller!.dispose();
    super.dispose();
  }
}
