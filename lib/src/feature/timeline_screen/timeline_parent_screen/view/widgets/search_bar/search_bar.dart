import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possy_app/src/common_widget_style/common_style/auth_style/auth_input_decoration_theme.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import '../../../view_model/timeline_screen_provider.dart';

class CustomSearchBar extends StatelessWidget{
  const CustomSearchBar({super.key});

/// build method
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, _) {

        final state = ref.read(timelineProvider.notifier);

        return TextFormField(
          controller: state.searchController,
          onChanged: (value){
            debugPrint("\nsearching for : $value\n");
            state.onSearch(value.toLowerCase());
          },
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            color: TimelineColor.textColor
          ),
          decoration: AuthInputDecorationTheme.lightInputDecorationTheme(
            borderColor: false,
              context: context,
              hintText: "Search",
            suffixIcon: GestureDetector(
              onTap: (){},
              child: Icon(Icons.search,color: TimelineColor.iconColor, size: 20.r,),
            )
          ),

        );
      }
    );
  }
}