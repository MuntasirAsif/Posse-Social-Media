import 'package:flutter/material.dart';

class AvatarStack extends StatelessWidget {
  final List<String> imageUrls;
  final int maxDisplay;
  final bool showExtra;

  const AvatarStack({super.key, required this.imageUrls, this.maxDisplay = 2,this.showExtra = true});

  @override
  Widget build(BuildContext context) {
    final displayAvatars = imageUrls.take(maxDisplay).toList();
    final remainingCount = imageUrls.length - maxDisplay;
    final avatarSize = 32.0;
    final overlap = 20.0;
    final totalWidth = avatarSize + (displayAvatars.length + (remainingCount > 0 ? 1 : 0) - 1) * overlap;

    return SizedBox(
      width: totalWidth,
      height: avatarSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < displayAvatars.length; i++)
            Positioned(
              left: i * overlap,
              child: CircleAvatar(
                radius: avatarSize / 2,
                backgroundImage: NetworkImage(displayAvatars[i]),
              ),
            ),
          if (remainingCount > 0 && showExtra)
            Positioned(
              left: displayAvatars.length * overlap,
              child: CircleAvatar(
                radius: avatarSize / 2,
                backgroundColor: Colors.deepPurple,
                child: Text(
                  '+$remainingCount',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
