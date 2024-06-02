import 'package:flutter/material.dart';
import 'package:test_project/screens/main_interface/home_screen.dart';
import 'package:test_project/widgets/components/consts/subtitle_text.dart';

class CategoryRoundedWidget extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback onTap;

  const CategoryRoundedWidget({
    required this.image,
    required this.name,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 5,
          ),
          SubtitleTextWidget(
            label: name,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, HomeScreen() as Route<Object?>);
//       },
//       child: Column(
//         children: [
//           Image.asset(
//             image,
//             height: 50,
//             width: 50,
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           SubtitleTextWidget(
//             label: name,
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//           )
//         ],
//       ),
//     );
//   }
// }
