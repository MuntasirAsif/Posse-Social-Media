import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'card_footer.dart';
import 'card_header.dart';

class PostCard extends StatelessWidget {
  final String pageId;
  final String profilePicture;
  final String userName;
  final String postDate;
  final String caption;
  final String? postImage;
  final int reactAmount;
  final int commentAmount;

   PostCard({
    super.key,
     required this.pageId,
    required this.profilePicture,
    required this.userName,
    required this.postDate,
    required this.caption,
    this.postImage,
    required this.reactAmount,
    required this.commentAmount,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          spacing: 12.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            CardHeader(
              pageId: pageId,
              profilePicture: profilePicture,
              userName: userName,
              postDate: postDate,
            ),

            /// body - caption
            SelectableText(caption, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),),

            /// body -  Image
            if (postImage != null)
              Image.asset(
                postImage!,
                width: double.infinity,
                height: 240.h,
                fit: BoxFit.cover,
              ),

            /// footer
            CardFooter(
              reactAmount: reactAmount,
              commentAmount: commentAmount,
            ),
          ],
        ),
      ),
    );
  }
}
