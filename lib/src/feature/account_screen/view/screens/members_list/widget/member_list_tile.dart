import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../../core/constant/icons.dart';
import '../../../../../../common_widget_style/common_widgets/spacer/auto_spacer.dart';
import 'member_list_pop_up_menu_button.dart';

class MemberListTile extends StatelessWidget {
  const MemberListTile({
    super.key,
    required this.name,
    required this.isMe,
    required this.isPremium,
  });

  final String name;
  final bool isMe;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      contentPadding: EdgeInsets.all(12.r),

      leading: ClipOval(
        child: Image.network('https://randomuser.me/api/portraits/men/1.jpg'),
      ),
      title: Row(
        children: [
          Text(name),
          isMe ? Text('(me)') : Text(''),
          AutoSpacer(space: 6),
          isPremium ? SvgPicture.asset(AppIcons.memberListPremium) : SizedBox(),
        ],
      ),
      trailing:
          isMe
              ? MemberListPopUpMenuButton(textTheme: textTheme)
              : SizedBox(),
    );
  }
}
