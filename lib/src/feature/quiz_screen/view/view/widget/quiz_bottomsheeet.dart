// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/button.dart';
import 'package:possy_app/src/feature/quiz_screen/view/view_model/select_provider.dart';

void showQuizbottomSheet({
  required BuildContext context,
  // required List<Map<String, String>> quizItems,
  required void Function(List<String> selectedImages) onSelected,
  required int quizIndex,
  required int optionIndex,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
    ),
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final quizState = ref.watch(quizSelectionProvider);
          final quizReadState = ref.read(quizSelectionProvider.notifier);
          final selected = quizState.selectedIndexes;

          return Container(
            width: double.infinity,
            height: 600.h,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                Container(
                  height: 6.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 47, 49),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                SizedBox(height: 20.h),

                // Scrollable quiz items
                Expanded(
                  child: GridView.builder(
                    itemCount: quizState.usersModel!.users!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Max width of each item
                      // crossAxisSpacing: 5.w,
                      // mainAxisSpacing: 15.h,
                    ),
                    itemBuilder: (_, index) {
                      final user = quizState.usersModel!.users![index];
                      bool isSelected = quizState.isOptionSelected![index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref
                                  .read(quizSelectionProvider.notifier)
                                  .toggle(
                                    quizIndex: quizIndex,
                                    optionIndex: optionIndex,
                                    userIndex: index,
                                    user: user
                                    //itemIndex
                                  );
                            },
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        user.profilePicture!,
                                        height: 64.h,
                                        width: 64.w,
                                        fit: BoxFit.cover,
                                        color:
                                            isSelected
                                                ? Colors.black.withOpacity(0.4)
                                                : null,
                                        colorBlendMode:
                                            isSelected
                                                ? BlendMode.darken
                                                : null,
                                      ),
                                    ),
                                    if (isSelected)
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Image.asset(
                                            "assets/images/quizscreen/tik.png",
                                            height: 20.h,
                                            width: 20.w,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 3.h),
                                SizedBox(
                                  width: 70.w,
                                  child: Text(
                                    user.userName!,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color:
                                          ref
                                                  .read(
                                                    quizSelectionProvider
                                                        .notifier,
                                                  )
                                                  .searchSelectedUser(
                                                    quizIndex: quizIndex,
                                                    optionIndex: optionIndex,
                                                    userId: user.userId!,
                                                  )
                                              ? Color(0xff1D1F2C)
                                              : Color(0xFF777980),
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (index<quizState.usersModel!.users!.length-3)
                            Container(
                              margin: EdgeInsets.only(top: 16.h),
                              width: double.infinity,
                              height: 1,
                              color: Color(0xffECEFF3),
                            )
                        ],
                      );
                    },
                  ),

                  // SingleChildScrollView(
                  //   child: Column(
                  //     children: List.generate((quizState.usersModel!.users!.length / 3).ceil(), (rowIndex) {
                  //       final rowItems = quizState.usersModel!.users!.skip(rowIndex * 3).take(3).toList();
                  //       return Column(
                  //         children: [
                  //
                  //                 Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: List.generate(rowItems.length, (i) {
                  //                   final itemIndex = rowIndex * 3 + i;
                  //                   final item = rowItems[i];
                  //
                  //                   /// dummy
                  //                   final isSelected = quizReadState.checkIsSelected(
                  //                       questionIndex: quizIndex,
                  //                       selectedUserId: item.userId!
                  //                   );
                  //
                  //                   return
                  //                     GestureDetector(
                  //                     onTap: () {
                  //                       ref.read(quizSelectionProvider.notifier).toggle(
                  //                           quizIndex: quizIndex,
                  //                           optionIndex: optionIndex,
                  //                           userId: item.userId!,
                  //                           //itemIndex
                  //                       );
                  //                     },
                  //                     child: Column(
                  //                       children: [
                  //                         Stack(
                  //                           alignment: Alignment.center,
                  //                           children: [
                  //                             ClipOval(
                  //                               child: Image.asset(
                  //                                 item.profilePicture!,
                  //                                 height: 64.h,
                  //                                 width: 64.w,
                  //                                 fit: BoxFit.cover,
                  //                                 color: isSelected ? Colors.black.withOpacity(0.4) : null,
                  //                                 colorBlendMode: isSelected ? BlendMode.darken : null,
                  //                               ),
                  //                             ),
                  //                             if (isSelected)
                  //                               Positioned(
                  //                                 top: 0,
                  //                                 right: 0,
                  //                                 child: Container(
                  //                                   height: 20,
                  //                                   width: 20,
                  //                                   decoration: BoxDecoration(
                  //                                     shape: BoxShape.circle,
                  //                                     color: Colors.white,
                  //                                   ),
                  //                                   child: Image.asset(
                  //                                     "assets/images/quizscreen/tik.png",
                  //                                     height: 20.h,
                  //                                     width: 20.w,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                           ],
                  //                         ),
                  //                         SizedBox(height: 3.h),
                  //                         SizedBox(
                  //                           width: 70.w,
                  //                           child: Text(
                  //                             item.userName!,
                  //                             style: TextStyle(
                  //                               fontSize: 11.sp,
                  //                               color: ref.read(quizSelectionProvider.notifier).searchSelectedUser(
                  //                                   quizIndex: quizIndex, optionIndex: optionIndex, userId: item.userId!
                  //                               ) ? Color(0xff1D1F2C) : Color(0xFF777980),
                  //                             ),
                  //                             textAlign: TextAlign.center,
                  //                             overflow: TextOverflow.ellipsis,
                  //                             maxLines: 1,
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   );
                  //                 }),
                  //               ),
                  //
                  //           if (rowIndex < (quizState.usersModel!.users!.length / 3).ceil() - 1)
                  //             Padding(
                  //               padding: EdgeInsets.symmetric(vertical: 8.h),
                  //               child: const Divider(),
                  //             ),
                  //           SizedBox(height: 16.h),
                  //         ],
                  //       );
                  //     }),
                  //   ),
                  // ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Mybutton(
                        color: const Color(0xffECEFF3),
                        text: "Cancel",
                        onTap: () {
                          ref.read(quizSelectionProvider.notifier).clear();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Expanded(
                      child: Mybutton(
                        color: const Color(0xff54BABC),
                        text: "Select",
                        onTap: () {
                          // final selectedImages = selected
                          //     .map((index) => quizItems[index]['image']!)
                          //     .toList();
                          // onSelected(selectedImages);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        },
      );
    },
  );
}
