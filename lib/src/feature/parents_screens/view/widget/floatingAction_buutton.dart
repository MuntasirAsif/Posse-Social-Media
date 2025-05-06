import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingHomeButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isKeyboardOpen;
  final bool isSelected;
  const FloatingHomeButton({
    super.key,
    required this.onTap,
    required this.isKeyboardOpen,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isKeyboardOpen) return const SizedBox.shrink();

    return Transform.translate(
      offset: const Offset(0, 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 78.w,
          height: 78,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
           color: isSelected ? const Color(0xFF789949) : Color(0xff777980),
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFFFFFFFF), width: 8),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFEDFFD0).withOpacity(.3),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              "assets/images/parent_screen/home.png",
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
