import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:luna/views/screens/account_screen/account_screen.dart';
import 'package:luna/views/screens/cart_screen/cart_screen.dart';
import 'package:luna/views/screens/home_screen/home_screen.dart';
import 'package:luna/views/screens/order_screen/order_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../logic/cubit/bottom_nav/bottom_nav_cubit.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/shared_preferences_service.dart';
import '../../widgets/bottom_nav_icon.dart';
import '../../widgets/internet_connection_screen/internet_connection_widget.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/main_screen";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(0),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: InternetConnectWidget(
              child: LazyLoadIndexedStack(
                index: BlocProvider.of<BottomNavCubit>(context).currentIndex,
                children: const [
                  HomeScreen(),
                  OrderScreen(),
                  CartScreen(),
                  AccountScreen()
                ],
              ),
            ),
            bottomNavigationBar: SizedBox(

              child: BottomNavigationBar(
                currentIndex:
                    BlocProvider.of<BottomNavCubit>(context).currentIndex,
                onTap: (index) {
                  bool isNotLogin =
                      SharedPreferencesService.instance?.token == "" ||
                          SharedPreferencesService.instance?.token == null;
                  BlocProvider.of<BottomNavCubit>(context)
                      .onNavbarIndexChange(index);
                  // if ((index == 1 || index == 2 || index == 3) &&
                  //     isNotLogin) {
                  //   Navigator.pushNamed(context, LoginScreen.routeName);
                  // } else {
                  //   BlocProvider.of<BottomNavCubit>(context)
                  //       .onNavbarIndexChange(index);
                  // }
                },
                backgroundColor: AppColors().white,
                unselectedItemColor: AppColors().black,
                unselectedFontSize: 12.px,
                selectedFontSize: 14.px,
                iconSize: 24.px,
                selectedItemColor: AppColors().primary,
                type: BottomNavigationBarType.fixed,

                items: [
                  BottomNavigationBarItem(
                    icon: bottomNavIcon(icon: Icons.home, isActive: false),
                    activeIcon: bottomNavIcon(icon: Icons.home, isActive: true),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: bottomNavIcon(
                        icon: Icons.list_alt_outlined, isActive: false),
                    activeIcon: bottomNavIcon(
                        icon: Icons.list_alt_outlined, isActive: true),
                    label: "Order",
                  ),
                  BottomNavigationBarItem(
                    icon: bottomNavIcon(
                        icon: Icons.shopping_cart_outlined, isActive: false),
                    activeIcon: bottomNavIcon(
                        icon: Icons.shopping_cart_outlined, isActive: true),
                    label: "Cart",
                  ),
                  BottomNavigationBarItem(
                    icon: bottomNavIcon(
                        icon: Icons.account_circle_outlined, isActive: false),
                    activeIcon: bottomNavIcon(
                        icon: Icons.account_circle_outlined, isActive: true),
                    label: "Account",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
