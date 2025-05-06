import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/icons.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/core/utils/utils.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import 'package:possy_app/src/common_widget_style/common_widgets/common_widgets.dart';
import 'package:possy_app/src/feature/timeline_screen/user_profile_screen/riverpod/user_profile_riverpod.dart';


class CustomTabBar extends ConsumerStatefulWidget {
  final TabController tabController;
  final List tabs;
  const CustomTabBar({super.key, required this.tabController, required this.tabs});

  @override
  ConsumerState<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends ConsumerState<CustomTabBar>{

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userProfileRiverpod);
    return Padding(
      padding: AppPadding.screenHorizontalPadding,
      child: Row(
        spacing: 12.w,
        children:  List.generate(2, (index){

          bool isSelected = state.profileBodyIndex == index;
          return GestureDetector(
            onTap: (){
              widget.tabController.animateTo(index);
              ref.read(userProfileRiverpod.notifier).switchTab(index: index);
            },
            child: Container(
            //  curve: Curves.linear,
             // duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
              decoration: BoxDecoration(
                  color: isSelected ? TimelineColor.tabBarColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(16.r)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4.w,
                children: [
                  Image.asset(widget.tabs[index]['iconPath'],color: TimelineColor.deepPrimaryColor,width: 16.w,height: 16.w,fit: BoxFit.cover,),
                  Text(widget.tabs[index]['label'],style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: TimelineColor.deepPrimaryColor
                  ),)
                ],
              ),
            ),
          );
        }),
      ),
    );




  }
}