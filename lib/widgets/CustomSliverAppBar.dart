import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSliverAppBar extends SliverAppBar {
  final String page_title;
  final String assetName = 'assets/icons/menu_icon.svg';

  CustomSliverAppBar({Key? key, required this.page_title});
  @override
  Widget? get leading => Builder(builder: (context) {
        Widget menu_icon = SvgPicture.asset(
          assetName,
        );
        return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: menu_icon);
      });
  @override
  Widget? get title => Text(page_title);
  @override
  bool? get centerTitle => true;
}
