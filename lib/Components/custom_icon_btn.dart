import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Constants/color_const.dart';



class CustomIconBtn extends StatelessWidget {
  final double size;
  final String svgPath;
  final void Function() onTap;
  const CustomIconBtn({
    Key? key,
    required this.svgPath,
    required this.onTap,
    this.size = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: SizedBox(
          width: size,
          height: size,
          child: SvgPicture.asset(
            svgPath,
            colorFilter: const ColorFilter.mode(
              ColorConst.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}