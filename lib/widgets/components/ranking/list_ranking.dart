import 'package:flutter/material.dart';

class SampleItem {
  final String id;
  final String name;

  SampleItem({required this.id, required this.name});
}

class SampleItemWidget extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/avaters/Avatar Default.jpg',
    'assets/avaters/Avatar 3.jpg',
    'assets/avaters/Avatar 6.jpg',
    // Thêm các đường dẫn ảnh khác ở đây
  ];
  final SampleItem item;
  final void Function(SampleItem)? onTap;

  SampleItemWidget({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(item.name, style: TextStyle(fontSize: 20),),
          SizedBox(width: 100,),
          Icon(Icons.favorite),
        ],
      ),
      leading: CircleAvatar(
        foregroundImage: AssetImage(imagePaths[int.parse(item.id) - 1]), // Truy cập vào đường dẫn hình ảnh tương ứng với mục
      ),
      onTap: onTap != null ? () => onTap!(item) : null,
      trailing: Icon(Icons.keyboard_arrow_right),
    );

  }
}
