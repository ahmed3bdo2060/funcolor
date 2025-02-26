
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funcolor/core/utils/text_styles.dart';
import 'package:funcolor/features/my_painting/model.dart';

class PaintingWidget extends StatelessWidget {
  final List<GridItem> items;
  final int crossAxisCount;
  final List<String> pageGroup;
  final bool insidecategory;
  final bool insideanimals;
  final bool isColorMixing;
  final double? gridHeight;
  final double childAspectRatio;

  const PaintingWidget({
    super.key,
    required this.items,
    required this.crossAxisCount,
    required this.insidecategory,
    required this.pageGroup,
    required this.insideanimals,
    this.gridHeight,  this.childAspectRatio = 1.0, required this.isColorMixing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        insideanimals == true
            ? Text(
                'Animals',
                textAlign: TextAlign.center,
                style: ts64Magic400,
              )
            : Container(),
        SizedBox(
          height: gridHeight ?? 499.h,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                mainAxisSpacing: 0.w),
            itemBuilder: (context, index) => isColorMixing==true?_buildColorMixing(item: GridItem(imageUrl: items[index].imageUrl,
                onTap: () {
                  Navigator.of(context).pushNamed(pageGroup[index]);
                },)) :_buildPaintingItem(
              item: GridItem(
                title: items[index].title,
                imageUrl: items[index].imageUrl,
                onTap: () {
                  Navigator.of(context).pushNamed(pageGroup[index]);
                },
              ),
            ),
            itemCount: items.length,
          ),
        ),
      ],
    );
  }

  Widget _buildPaintingItem({
    required GridItem item,
  }) {
    return InkWell(
      onTap: item.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          item.isSvg == true ? SvgPicture.asset(
            item.imageUrl,
            width: item.imgWidth ?? 180.w,
            height: item.imgHeight ?? 176.27.h,
          ) : Image.asset(
            item.imageUrl,
            width: item.imgWidth ?? 180.w,
            height: item.imgHeight ?? 176.27.h,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            item.title!,
            style: ts24minnie400,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
  Widget _buildColorMixing({
    required GridItem item,
  }) {
    return InkWell(
      onTap: item.onTap,
      child:item.isSvg == true ? SvgPicture.asset(
        item.imageUrl,
        width: item.imgWidth ?? 180.w,
        height: item.imgHeight ?? 176.27.h,
      ) : Container(
        height: item.imgHeight,
        width: item.imgWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64.r)
        ),
        child: Image.asset(
          item.imageUrl,
          width: item.imgWidth ?? 180.w,
          height: item.imgHeight ?? 176.27.h,
        ),
      ),
    );
  }
}
