import 'package:possy_app/src/feature/timeline_screen/report_options.dart';

import '../../../../model/user_post_model.dart';

class TimelineScreenModel{
  PossyModel? userPostModel;

  List<Posts>? filteredUserPostModel;

  ReportOptions? reportOption;

  TimelineScreenModel({this.userPostModel, this.filteredUserPostModel, this.reportOption});

  TimelineScreenModel copyWith({
    PossyModel? userPostModel,
    List<Posts>? filteredUserPostModel,
    ReportOptions? reportOption
  })
  {
    return TimelineScreenModel(
        userPostModel: userPostModel ?? this.userPostModel,
      filteredUserPostModel: filteredUserPostModel ?? this.filteredUserPostModel,
      reportOption: reportOption,
    );
  }

}