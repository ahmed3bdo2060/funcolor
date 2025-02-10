import 'package:flutter/material.dart';
import 'package:funcolor/resourse/assets_manager.dart';
import 'package:funcolor/resourse/string_manager.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../resourse/color.dart';
import '../../../resourse/values_manager.dart';
import 'styles.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    super.key,
    required this.userName,
    required this.gameGroup,
    required this.inSideGame,
    this.appBarIcon = "",
  });

  final String userName;
  final String gameGroup;
  final bool inSideGame;
  final String appBarIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              ImageAssets.appBarLeading,
              width: 102,
              height: 69.51,
            ),
            Row(
              children: [
                Text(
                  userName,
                  style: GameStyles.bubleStyle,
                ),
                const SizedBox(width: 16),
                Text(
                  AppStrings.divider,
                  style: GameStyles.dividerStyle,
                ),
                const SizedBox(width: 16),
                Text(
                  gameGroup,
                  style: GameStyles.minnieStyle,
                ),
                const SizedBox(width: 16),
                if (inSideGame)
                  SizedBox(
                    width: 63,
                    height: 63,
                    child: Image.asset(appBarIcon),
                  ),
              ],
            ),
            Row(
              children: [
                Stack(children: [
                  Image.asset(ImageAssets.userBackground, width: 126, height: 133),
                  Positioned(
                    bottom: 20.25,
                    top: 35.75,
                    left: 32,
                    right: 26.33,
                    child:Container(
                      width: 68.0, // Width of the story icon
                      height: 68.0, // Height of the story icon
                      decoration:_buildContainerDecoration2() ,
                      child: ClipOval(
                        child: CircleAvatar(
                          radius: 36.0, // Radius of the inner CircleAvatar
                          backgroundImage: AssetImage(ImageAssets.userPicture)
                        ),
                      ),
                    )
                  ),
                ]),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    ImageAssets.drawer,
                    width: 49,
                    height: 49,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

BoxDecoration _buildContainerDecoration2() {
  return BoxDecoration(
    shape: BoxShape.circle, // Make it circular
    gradient: LinearGradient(
      colors: [ColorManager.borderColor,ColorManager.borderColor2], // Gradient colors for the border
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    border: Border.all(
      width: 4.0, // Border width (thickness of the gradient border)
      color: Colors.transparent, // Making the border transparent to only show the gradient
    ),
  );
}
