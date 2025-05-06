import 'package:flutter/material.dart';
import '../../widget/account_section.dart';
import '../../widget/edit_profile_header.dart';
import '../../widget_list/widget_list.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  get textTheme => null;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          EditProfileHeader(),
          AccountSection(
            textTheme: textTheme,
            ///List of widget for all section
            widgetList: AccountWidgetList.editProfile(context),
          ),
        ],
      ),
    );
  }
}


