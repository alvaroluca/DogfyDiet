import 'package:dogfydiet/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DogfyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget? leading;

  const DogfyAppBar({super.key, this.height = kToolbarHeight, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: leading,
      title: SvgPicture.asset(
        AppAssets.dogfyDiet,
        height: 32,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
