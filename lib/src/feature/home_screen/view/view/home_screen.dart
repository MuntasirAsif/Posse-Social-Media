import 'package:flutter/material.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/src/feature/home_screen/view/view/home_body.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/bottomsheet.dart';
import 'package:possy_app/src/feature/home_screen/view/widget/customHeader.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
        WidgetsBinding.instance.addPostFrameCallback((_) async {

     showCustomSheet(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.lightGreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomHeaderHome(),
          Expanded(child: HomeBody()),
        ],
      ),
    );
  }
}