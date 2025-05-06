import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/core/constant/images.dart';
import 'package:possy_app/core/constant/imojis.dart';
import 'package:possy_app/core/constant/padding.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import 'package:possy_app/src/feature/timeline_screen/page_id.dart';
import 'package:possy_app/src/feature/timeline_screen/timeline_parent_screen/view/widgets/timeline_body/post_card/postCard.dart';
import '../../../../../../model/user_post_model.dart';
import '../../../view_model/timeline_screen_provider.dart';
import '../search_bar/search_bar.dart';

class TimelineBody extends StatelessWidget {
  List<Posts> postList;
  String pageId;
   TimelineBody({super.key, required this.postList, required this.pageId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.screenHorizontalPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
           // if(pageId == TimelinePageId.timeline)
            SizedBox(height: 16.h),

            if(pageId == TimelinePageId.timeline)
              Column(
                children: [
                  CustomSearchBar(),

                  SizedBox(height: 16.h),
                ],
              ),



            Consumer(
              builder: (_, ref, _) {
                final state = ref.watch(timelineProvider);
                final editState = ref.read(timelineProvider.notifier);

                return  state.userPostModel?.posts == null
                    ? Center(
                      child: CircularProgressIndicator(
                        color: TimelineColor.primaryColor,
                      ),
                    )
                    :



                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [



                    if(editState.searchController.text.isNotEmpty && (pageId == TimelinePageId.timeline))
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Showing results for ${editState.searchController.text} : ",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: TimelineColor.textColor,
                            fontWeight: FontWeight.w700
                          ),),
                          SizedBox(height: 16.h,),
                        ],
                      ),

                    if((pageId == TimelinePageId.timeline) && editState.searchController.text.isNotEmpty && state.filteredUserPostModel!.isEmpty)
                      Center(child: Column(
                        spacing : 10.h,
                        children: [
                          SizedBox(height: 100.h,),
                          Image.asset(AppImoji.sad,width: 32.w,height: 32.w,fit: BoxFit.cover,),
                          Text("No result!",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: TimelineColor.lightTextColor
                          ),)
                        ],
                      ),)


                    else
                    ListView.builder(
                          padding: EdgeInsets.only( bottom: 25.h),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: postList.length,
                          itemBuilder: (_, index) {
                            final post = postList[index];

                            return PostCard(
                              pageId: pageId,
                              reactAmount: post.reacts!,
                              caption: post.caption!,
                              commentAmount: post.comments!,
                              postDate: post.postDate!,
                              postImage: post.imagePath,
                              profilePicture: post.profilePicture!,
                              userName: post.userName!,
                            );
                          },
                        ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
