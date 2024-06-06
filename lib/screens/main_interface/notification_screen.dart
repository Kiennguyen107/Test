import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



class Notification {
  String title;
  String content;
  String imagePath;
  DateTime timestamp;
  bool isRead;

  Notification({
    required this.title,
    required this.content,
    required this.imagePath,
    required this.timestamp,
    this.isRead = false,
  });
}

class ClubNotificationScreen extends StatefulWidget {
  @override
  _ClubNotificationScreenState createState() => _ClubNotificationScreenState();
}

class _ClubNotificationScreenState extends State<ClubNotificationScreen> {
  List<Notification> notifications = [
    Notification(
      title: 'Quy định',
      content: "Đây là quy định của câu lạc bộ:\n"
          "1. Thành viên câu lạc bộ cần có trang phục chỉnh tề, phù hợp với quá trình tập luyện hoặc thi đấu (quần áo, giày,…)\n"
          "2. Mỗi thành viên của clb cần có ý thức, nghiêm túc và có trách nhiệm trong quá trình tập luyện.\n"
          "3. Tuân thủ nghiêm túc các quy định về thời gian của câu lạc bộ. Trong các trường hợp ngoại lệ, cần có được sự đồng ý của ban chủ nhiệm câu lạc bộ.\n"
          "4. Có thái độ tôn trọng với mọi thành viên tron clb.\n"
          "5. Có ý thức và tinh thần giữa vệ sinh chung cho câu lạc bộ và thực hiện tổng vệ sinh vào các ngày đã được quy định.\n"
          "6. Thành viên của câu lạc bộ cần giữa gìn bàn đánh cùng các trang thiết bị chung của clb. Đồ cá nhân cần tự bảo quản.\n"
          "7. Thực hiện đóng lệ phí hàng tháng đầy đủ và đúng giờ theo quy định của câu lạc bộ.\n"
          "8. Tuân thủ theo sự điều phối của ban chủ nhiệm câu lạc bộ trong thi đấu và giao lưu với các câu lạc bộ khác.\n"
          "9. Thành viên câu lạc bộ có cổ động viên đi cùng trong các đợt thi đấu, giao lưu cần đảm bảo về tác phong ăn mặc, nói chuyện văn minh – văn hóa.\n",
      timestamp: DateTime.now(),
      isRead: true,
      imagePath: '',
    ),
  ];
  int id_right = 3;

  void addNotification(Notification notification) {
    setState(() {
      notifications.add(notification);
    });
  }

  void updateNotification(int index, Notification notification) {
    setState(() {
      notifications[index] = notification;
    });
  }

  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  void markAsRead(int index) {
    setState(() {
      notifications[index].isRead = true;
    });
  }

  void navigateToAddNotification({int? index}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddOrEditNotificationScreen(
          onAddNotification: addNotification,
          onUpdateNotification: updateNotification,
          notification: index != null ? notifications[index] : null,
          index: index,
        ),
      ),
    );
  }

  void navigateToNotificationDetails(int index) {
    markAsRead(index);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationDetailsScreen(notification: notifications[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Thông báo CLB',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            color: notification.isRead ? Colors.white : Colors.green.shade100,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              title: Row(
                children: [
                  Text(notification.title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
                  SizedBox(width: 8,),
                  Text(DateFormat('HH:mm').format(notification.timestamp)),
                ],
              ),
              subtitle: Text(
                notification.content,
                style: TextStyle(fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // if (id_right != 3)
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => navigateToAddNotification(index: index),
                  ),
                  // if (notification.title != 'Quy định')
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteNotification(index),
                    ),
                ],
              ),
              onTap: () => navigateToNotificationDetails(index),
            ),
          );
        },
      ),
      floatingActionButton: id_right != 1
          ? FloatingActionButton(
        onPressed: navigateToAddNotification,
        child: Icon(Icons.add),
      )
          : null,
    );
  }
}

class AddOrEditNotificationScreen extends StatefulWidget {
  final void Function(Notification) onAddNotification;
  final void Function(int, Notification) onUpdateNotification;
  final Notification? notification;
  final int? index;

  AddOrEditNotificationScreen({
    required this.onAddNotification,
    required this.onUpdateNotification,
    this.notification,
    this.index,
  });

  @override
  _AddOrEditNotificationScreenState createState() => _AddOrEditNotificationScreenState();
}

class _AddOrEditNotificationScreenState extends State<AddOrEditNotificationScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  String _imagePath = '';

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.notification != null) {
      _titleController.text = widget.notification!.title;
      _contentController.text = widget.notification!.content;
      _imagePath = widget.notification!.imagePath;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  void saveNotification() {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isEmpty || content.isEmpty) {
      return;
    }

    final newNotification = Notification(
      title: title,
      content: content,
      imagePath: _imagePath,
      timestamp: DateTime.now(),
    );

    if (widget.index == null) {
      widget.onAddNotification(newNotification);
    } else {
      widget.onUpdateNotification(widget.index!, newNotification);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.notification == null ? 'Thêm thông báo' : 'Sửa thông báo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Tiêu đề'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Nội dung'),
              maxLines: 4,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.camera),
                  child: Text('Chụp ảnh'),
                ),
                ElevatedButton(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  child: Text('Chọn ảnh từ thư viện'),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (_imagePath.isNotEmpty)
              Image.file(
                File(_imagePath),
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveNotification,
              child: Text(widget.notification == null ? 'Thêm thông báo' : 'Lưu thông báo'),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationDetailsScreen extends StatelessWidget {
  final Notification notification;

  NotificationDetailsScreen({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(notification.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(DateFormat('dd/MM/yyyy HH:mm').format(notification.timestamp), style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            if (notification.imagePath.isNotEmpty)
              Image.file(File(notification.imagePath), fit: BoxFit.cover),
            if (notification.imagePath.isNotEmpty)
              SizedBox(height: 10),
            Text(notification.content, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
