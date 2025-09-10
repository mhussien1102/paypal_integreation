import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/style.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: Center(
      child: GestureDetector(
        onTap: () {},
        child: SvgPicture.asset('assets/icons/Arrow 1.svg'),
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text(title ?? "", style: AppTextStyles.text25w500),
    centerTitle: true,
  );
}
