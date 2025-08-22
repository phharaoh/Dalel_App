import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/card/presentation/views/card_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:dalel/features/search/presentation/views/search_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';

PersistentTabController _controller = PersistentTabController();

class WrapperHome extends StatelessWidget {
  const WrapperHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.style9,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
        colorBehindNavBar: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const SearchView(),
    const CardView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesHomeIconActive),
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesHomeIcon),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesShoppingCartActive),
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesShoppingCart),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesSearchActive),
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesSearch),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesPersonActive),
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesPerson),
    ),
  ];
}
