import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../resourse/assets_manager.dart';
import '../model.dart';

class PaintingWidget extends StatelessWidget {
  final List<GridItem> items;
  final int crossAxisCount;
  final double spacing;
  final String leftImage;
  final double hieght;
  final List<String> pageGroup;
  final double width;
  final bool insidecategory;
  final bool insideanimals;

    PaintingWidget(
      {Key? key,
      required this.items,
      required this.crossAxisCount,
      required this.spacing,
      required this.leftImage,
      this.hieght=358.65,
      this.width=313.29,
        required this.insidecategory, required this.pageGroup, required this.insideanimals
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          insidecategory==true?Padding(
            padding: const EdgeInsets.only(right: 32),
            child: Image.asset(leftImage, height: hieght, width: width),
          ):Container(),
          Expanded(
            child: Column(
              children: [
                insideanimals==true?Text(
                  'Animals',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Comic',
                  ),
                ):Container(),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount),
                    itemBuilder: (context, index) =>
                    _buildPaintingItem(item: GridItem(title:items[index].title,
                        imageUrl:items[index].imageUrl,onTap: () {
                          Navigator.of(context).pushNamed(pageGroup[index]);
                        },)),
                        // _buildPaintingItems(context)[index],
                    itemCount: items.length,
                    padding: EdgeInsets.all(18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaintingItem({
    required GridItem item
  }) {
    return InkWell(
      onTap: item.onTap,
      child:
      Container(
        color: Colors.white,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset(
                item.imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                item.title!,
                style:TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class DynamicGridView extends StatelessWidget {
//   final List<GridItem> items;
//   final int crossAxisCount;
//   final double spacing;
//
//   const DynamicGridView({
//     Key? key,
//     required this.items,
//     this.crossAxisCount = 2,
//     this.spacing = 16.0,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: EdgeInsets.all(spacing),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         crossAxisSpacing: spacing,
//         mainAxisSpacing: spacing,
//         childAspectRatio: 1.0,
//       ),
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return GridItemWidget(item: items[index]);
//       },
//     );
//   }
// }



// class GridItemWidget extends StatelessWidget {
//   final GridItem item;
//
//   const GridItemWidget({
//     Key? key,
//     required this.item,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: item.onTap,
//       child: Card(
//         elevation: 2.0,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Expanded(
//               child: Image.network(
//                 item.imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 item.title!,
//                 style: Theme.of(context).textTheme.titleMedium,
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
