import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../resources/resources.dart';
import '../utils/helpers/navigation_helper.dart';
import '../values/app_routes.dart';
import '../values/app_strings.dart';
import '../values/app_theme.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    final divider = Divider(color: AppTheme.white.withOpacity(0.3), height: 1);

    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: AppTheme.scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        hoverTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [AppTheme.accentCanvasColor, AppTheme.canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: AppTheme.canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(Vectors.avatar),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: AppStrings.index,
          onTap: () => NavigationHelper.pushReplacementNamed(AppRoutes.index),
        ),
        SidebarXItem(
          icon: Icons.collections,
          label: AppStrings.entity,
          onTap: () => NavigationHelper.pushReplacementNamed(AppRoutes.entity),
        ),
        SidebarXItem(
          icon: Icons.construction,
          label: AppStrings.entityField,
          onTap: () => NavigationHelper.pushReplacementNamed(AppRoutes.data),
        ),        
        SidebarXItem(
          icon: Icons.people,
          label: AppStrings.users,
          onTap: () => NavigationHelper.pushReplacementNamed(AppRoutes.test),
        ),
        SidebarXItem(
          icon: Icons.exit_to_app,
          label: AppStrings.logout,
          selectable: false,
          onTap: () => NavigationHelper.pushReplacementNamed(AppRoutes.login)
        ),
      ],
    );
  }

  void _showDisabledAlert(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          AppStrings.disabledAlert,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
