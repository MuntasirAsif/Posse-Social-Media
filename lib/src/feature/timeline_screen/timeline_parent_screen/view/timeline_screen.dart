import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:possy_app/src/common_widget_style/common_style/timeline_style/timeline_color.dart';
import 'package:possy_app/src/feature/timeline_screen/page_id.dart';
import 'package:possy_app/src/feature/timeline_screen/timeline_parent_screen/view/widgets/timeline_body/timeline_body.dart';
import 'package:possy_app/src/feature/timeline_screen/timeline_parent_screen/view/widgets/timeline_header/timeline_header.dart';
import 'package:possy_app/src/feature/timeline_screen/timeline_parent_screen/view_model/timeline_screen_provider.dart';

import '../../../../model/user_post_model.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TimelineColor.screenBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TimelineScreenHeader(),

          Expanded(
            child: Consumer(
              builder: (_, ref, _) {
                final state = ref.watch(timelineProvider);
                return TimelineBody(
                  pageId: TimelinePageId.timeline,
                  postList: (state.filteredUserPostModel ?? []),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
