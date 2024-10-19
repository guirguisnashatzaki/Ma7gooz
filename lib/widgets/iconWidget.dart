import 'package:flutter/cupertino.dart';

class IconWidget extends StatelessWidget {
  String path;
  IconWidget({Key? key,required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: Image.asset(path),
    );
  }
}