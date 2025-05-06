import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/feature/parents_screens/view/widget/customNavbarItem.dart';
import 'package:possy_app/src/feature/parents_screens/view_Model/parents_screen_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context,) {
    return BottomAppBar(
      surfaceTintColor: Colors.transparent,
      elevation: 10,
      color: const Color(0xFFFFFFFF),
      shape: null,
      clipBehavior: Clip.none,
      child: SizedBox(
        height: 56,
        child: Consumer(
          builder: (_, ref, _) {
            /// This is for edit on function call
            final parentReadProvider = ref.read(parentsScreenProvider.notifier);

            /// This is for variable update listening
            final parentProvider = ref.watch(parentsScreenProvider);

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomBottomNavItem(
                  iconPath: "assets/images/parent_screen/01.png",
                  label: "Quiz",
                  onTap: () => parentReadProvider.onSelectedIndex(0),
                  isActive: parentProvider.selectedIndex == 0,
                  activeColor: Color(0xff54BABC),
                  defaultColor: Color(0xff777980),
                  
                ),
                
                CustomBottomNavItem(
                  iconPath: "assets/images/parent_screen/02.png",
                  label: "Timeline",
                  onTap: () => parentReadProvider.onSelectedIndex(1),
                  isActive: parentProvider.selectedIndex == 1,
                   activeColor: Color(0xff9EBA72),
                  defaultColor: Color(0xff777980),
                ),
                const Expanded(child: SizedBox()),
                CustomBottomNavItem(
                  iconPath: "assets/images/parent_screen/04.png",
                  label: "Vibe Check",
                  onTap: () => parentReadProvider.onSelectedIndex(3),
                  isActive: parentProvider.selectedIndex == 3,
                  activeColor: Color(0xff6A42C2),
                  defaultColor: Color(0xff777980),
                ),
                CustomBottomNavItem(
                  iconPath: "assets/images/parent_screen/05.png",
                  label: "Poll",
                  onTap: () => parentReadProvider.onSelectedIndex(4),
                  isActive: parentProvider.selectedIndex == 4,
                  activeColor: Color(0xffEB47A7),
                  defaultColor: Color(0xff777980),

                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
