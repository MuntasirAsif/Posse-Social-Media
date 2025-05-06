import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/src/feature/timeline_screen/page_id.dart';
import 'package:possy_app/src/feature/timeline_screen/timeline_parent_screen/view/widgets/timeline_body/timeline_body.dart';
import 'package:possy_app/src/feature/timeline_screen/user_profile_screen/riverpod/user_profile_riverpod.dart';
import 'package:possy_app/src/feature/timeline_screen/user_profile_screen/view/widgets/custom_tab_bar.dart';
import 'package:possy_app/src/feature/timeline_screen/user_profile_screen/view/widgets/profile_screen_header.dart';
import '../../../../../core/constant/icons.dart';
import '../../../../common_widget_style/common_style/timeline_style/timeline_color.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> with TickerProviderStateMixin{


  late TabController _tabController;
  final tabs = [
    {'label': 'Posts', 'iconPath': AppIcons.newsfeed},
    {'label': 'Media', 'iconPath': AppIcons.photo},
  ];

  @override
  void initState() {

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener((){
      if(_tabController.indexIsChanging){
        ref.read(userProfileRiverpod.notifier).switchTab(index: _tabController.index);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TimelineColor.screenBackgroundColor,
       body: Column(
         children: [

           /// User Profile Screen Header
           UserProfileScreenHeader(
             userName: "Broklyn",
             profilePicture: AppImages.male2,
             fullName: "Brooklyn Simmons",
           ),

         SizedBox(height: 20.h,),


         // CustomTabBar(tabController: _tabController, tabs: tabs,),
           Container(width: double.infinity,
             decoration: BoxDecoration(borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(20.r),
             bottomRight: Radius.circular(20.r),
           ),
             color: TimelineColor.screenBackgroundColor,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withValues(alpha: 0.05),
                 offset: Offset(4, 18),
                 blurRadius: 10,
                 spreadRadius: 10
               )
             ]
           ),
             child: Column(
               children: [
                 CustomTabBar(tabController: _tabController, tabs: tabs,),
                 SizedBox(height: 20.h,),
               ],
             ),
           ),

         //  TabBarView(children: children),
           /// Post Body
           Expanded(
             child: TabBarView(
               controller: _tabController,
               physics: NeverScrollableScrollPhysics(),
               children: [
                 Consumer(
                   builder: (_, ref, _) {
                     final state = ref.watch(userProfileRiverpod);
                     return TimelineBody(postList: state.userProfileModel!.posts!, pageId: TimelinePageId.profile,);
                   }
                 ),

                 Center(child: Text("Media Tab"),)
               ],
             ),
           )
         ],
       ),
    );
  }
}