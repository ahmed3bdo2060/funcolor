import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funcolor/core/constants/app_icons.dart';
import 'package:funcolor/core/constants/app_images.dart';
import 'package:funcolor/core/utils/text_styles.dart';
import 'package:funcolor/features/game_board/presentation/widgets/app_bar_row.dart';
import 'package:funcolor/features/game_board/presentation/widgets/three_items_bottom_navigation.dart';

class ColorMixingSampls extends StatefulWidget {
  const ColorMixingSampls({super.key, required this.images, required this.width});
final List<String> images;
final double width;
  @override
  State<ColorMixingSampls> createState() => _ColorMixingSamplsState();
}

class _ColorMixingSamplsState extends State<ColorMixingSampls> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarRow(gameGroup: "Color Mixing", inSideGame: true,appBarIcon: AppIcons.colorMixingIcon,),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Level 1- 3 Colors",style: ts64Magic400,)),
          SizedBox(height: 48.h,),
          Container(
            height: 189.42.h,
              padding: EdgeInsets.symmetric(horizontal: 91.w),
              child: ListView.builder(itemBuilder: (context, index) => _Item(image: widget.images[index], width: widget.width,),
                  itemCount: widget.images.length,scrollDirection: Axis.horizontal,shrinkWrap: true,),),
          SizedBox(height: 73.h,),
          InkWell(onTap: () {
            Navigator.of(context).pushNamed("/colorMixingLevels");
          },
            child:SvgPicture.asset(AppIcons.practiceBtn) ,)
        ],
      ),
      bottomNavigationBar: ThreeItemsBottomNavigation(insideGame: true),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.image, required this.width,});
  final String image;
  final double width;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SvgPicture.asset(image,height: 188.68.h, width: 188.73.w,),
        SizedBox(width: width,)
      ],
    );
  }
}
