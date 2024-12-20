[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/clRq4viz)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-2e0aaae1b6195c2367325f4f02e2d04e9abb55f0b24a779b69b11b9e10269abc.svg)](https://classroom.github.com/online_ide?assignment_repo_id=17110087&assignment_repo_type=AssignmentRepo)

# Bài tập lớn - Ứng dụng nghe nhạc tích hợp Firebase

## Thông tin sinh viên
- **Họ và tên**: Nguyễn Chí Kiên
- **MSSV**: 2121050922
- **Lớp**: DCCTCLC66A2

## Giới thiệu
Đây là ứng dụng nghe nhạc đơn giản với Dart và Flutter tích hợp với Firebase để cung cấp tính năng hiện đại và dễ sử dụng. Ứng dụng cho phép người dùng phát nhạc, quản lý danh sách phát và đồng bộ hóa dữ liệu qua đám mây firebase, mang lại trải nghiệm mượt mà và thuận tiện. Đây là lựa chọn lý tưởng cho những ai yêu thích âm nhạc và muốn khám phá công nghệ hiện đại. Một ứng dụng di động hoàn chỉnh sử dụng Flutter và Dart, áp dụng các kiến thức đã học về lập trình giao diện người dùng, quản lý trạng thái, kiểm thử tự động và CI/CD với GitHub Actions.

## Mục tiêu
- Trải nghiệm người dùng đơn giản: Cung cấp giao diện thân thiện, dễ sử dụng, phù hợp với mọi đối tượng người dùng.
- Hiểu và áp dụng các cách quản lý trạng thái trong ứng dụng Flutter.
- Quản lý nhạc thông minh: Cho phép tạo, chỉnh sửa và quản lý danh sách phát cá nhân một cách nhanh chóng và thuận tiện.
- Đồng bộ hóa dữ liệu: Sử dụng Firebase để lưu trữ và đồng bộ hóa dữ liệu người dùng, đảm bảo truy cập dễ dàng trên nhiều thiết bị.
- Thực hiện được các thao tác CRUD (Create, Read, Update, Delete) cơ bản với dữ liệu.
- Biết áp dụng kiểm thử tự động để đảm bảo chất lượng ứng dụng.
- Biết áp dụng CI/CD với GitHub Actions để tự động hóa quy trình kiểm thử và triển khai.

## Báo cáo kết quả
### Chạy thử ứng dụng:
1. Tải mã nguồn từ repository.
    ```bash
    git clone https://github.com/HUMG-IT/flutter-final-project-Kiennguyen107.git
    ```

2. Cài đặt các dependencies:
   ```bash
   flutter pub get
   ```
3. Chạy ứng dụng:
   ```bash
   flutter run
   ```
### Các bước thực hiện:
#### Bước 1: Khởi tạo dự án
1. Clone file code dự án được tạo sẵn trên Github về để thực hiện làm bài tập lớn
2. Mở ứng dụng VS Code và mở thư mục vừa clone về `flutter-final-project-Kiennguyen107`
#### Bước 2: Tích hợp Firebase vào ứng dụng
- **Firebase là gì?** Firebase là một nền tảng phát triển ứng dụng được Google cung cấp, hỗ trợ các nhà phát triển xây dựng và quản lý ứng dụng một cách nhanh chóng và hiệu quả. Nó cung cấp một bộ công cụ và dịch vụ phong phú cho cả ứng dụng di động và web.
- **Lợi ích khi sử dụng Firebase**: Tích hợp nhanh chóng với nhiều nền tảng (iOS, Android, Web). Không cần quản lý cơ sở hạ tầng phức tạp. Hỗ trợ mở rộng ứng dụng khi số lượng người dùng tăng.
- **Giải pháp:** Firebase là giải pháp mạnh mẽ và toàn diện, giúp các nhà phát triển tập trung vào việc tạo ra giá trị cho người dùng thay vì phải giải quyết các vấn đề kỹ thuật phức tạp.

*Các Bước Tích Hợp*:
1. Đăng nhập và firebase và tạo dự án mới. Nếu chưa có tài khoản, bạn có thể truy cập vào đường link sau và tạo dự án mới: https://firebase.google.com/.
2. Sau khi tạo dự án thành công. Ở trong dự án sẽ có lựa chọn cho bạn tích hợp firebase vào ứng dụng của mình.
3. Yêu cầu phải cài đặt Firebase CLI và Flutter SDK. Bạn có thể vào theo đường link này để rõ hơn về yêu cầu: https://firebase.google.com/docs/flutter/setup?hl=en&authuser=0&platform=ios. Khi thư mục lib của bạn có thêm file: `firebase_options.dart` nghĩa là bạn đã thành công tích hợp firebase vào dự án của bạn.
4. Sau khi đã cài đặt xong. Hãy thêm các thư viện của firebase vào dự án của bạn qua file `pubspec.yaml`:

    ```bash
    firebase_auth: ^5.3.3
    firebase_core: ^3.8.0
    cloud_firestore: ^5.5.0
    firebase_storage: ^12.3.7
    ```
  5. Cuối cùng thêm dòng code vào file `main.dart` để có thể sử dụng ứng dụng của bạn với firebase:
      ```dart
      import 'package:firebase_core/firebase_core.dart';
      import 'firebase_options.dart';

      // ...

      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
      );
      ```
#### Bước 3: Phát triển dự án và kiểm thử
1. Tạo model để quản lý. Sử dụng `dart data class generator extension` để tạo ra các class model như:
  - User model trong file `user_model.dart` để quản lý các trường thông tin người dùng dễ dàng hơn:
      ```dart
        String id; //Id của người dùng
        String firstName; //Họ
        String lastName; //Tên
        String email; //Email
        int age; //Tuổi
      ```
  - Music model trong file `music_model.dart` để quản lý các trường thông tin về bài hát:
      ```dart
      String id; //Id bài hát
      String name; //Tên bài hát
      String artist; //Nghệ sĩ
      String avaSong; //Ảnh bài hát
      String filename; //File nhạc
      DateTime releaseDate; //Ngày phát hành
      int like; //Lượt thích
      ```
  - Playlist model trong file `playlist_model.dart` để quản lý các trường thông tin về playlist của người dùng tạo riêng cho mình:
      ```dart
      String id; //Id của playlist
      String name; //Tên
      String avaPlaylist; //Ảnh
      Map<String, dynamic> musicList; //Thông tin bài hát được cho vào playlist
      ```
  - Event model trong file `event_model.dart` để quản lý thông tin lịch trình các bài hát sắp tới sẽ được ra mắt:
      ```dart
      String id; //Id sự kiện
      DateTime startTime; //Thời gian bắt đầu
      DateTime endTime; //Thòi gian kết thúc
      bool isAllDay; //Sự kiện cả ngày
      String subject; //Chủ đề
      String notes; //Ghi chú
      String recurrenceRule; //Quy tắc
      ```
2. Thực hiện viết code tạo giao diện UI, UX cho người dùng cũng như áp dụng các thao tác CRUD các thông tin người dùng, bài hát, playlist cũng như các sự kiện.
  - Đối với bài hát sử dụng các thư viện:
    ```dart
    image_picker: ^1.1.2 //Lấy ảnh
    file_picker: ^8.1.4 //Láy file
    cached_network_image: ^3.4.1 //Tải Ảnh
    audioplayers: ^6.1.0  //Thư viện phát nhạc
    just_audio: ^0.9.42 //Thư viện phát nhạc trong nền
    ```
  - Việc sử dụng thư viện `audioplayers` và `justaudio` sẽ giúp ứng dụng phát nhạc và quản lý trạng thái của bài hát khi phát dễ dàng hơn.
  - Cùng với thư viện `firebase_storage` sẽ giúp lưu trữ những dữ liệu của bài hát trên firebase.
3. Viết code thao tác đẩy, lấy và xử lý dữ liệu thông qua model lên firebase:

    ***USER:*** Để có thể thao tác CRUD với đối tượng người dùng sử dụng firebase thì chúng ta phải dùng các câu lệnh như sau:
 - Tạo và xác thực người dùng mới: 
    ```dart
    //Tạo người dùng trên firebase auth để có thể xác thực
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), //email
          password: _passwordController.text.trim(), //Mật khẩu
        );

    // Đẩy dữ liệu người dùng lên firebase
    Future addUserDetails(Map<String, dynamic> userInfoMap, String id)            async {
      try {
        await FirebaseFirestore.instance
            .collection('users') //Đường dẫn colletiin
            .doc(id) //id người dùng
            .set(userInfoMap); //Dữ liệu người dùng
      } catch (e) {}
    }
    ```
  - Xác thực và lấy lại quên mật khẩu:
    ```dart
    //Xác thực email
    Future<void> sendVerifyLink() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification().then((value) => {
          Get.snackbar('Link sent', 'Please check your email',
              margin: const EdgeInsets.all(30),
              snackPosition: SnackPosition.BOTTOM),
      });
    }
    //Lấy lại khi quên mật khẩu
    Future PasswordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      }catch(e){}
    }
    ```
  - Lấy thông tin người dùng:
    ```dart
    Future<UserModel> geUserById(String id) async {
      try {
        // Lấy tài liệu từ Firestore dựa vào id
        final docSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
        final data = docSnapshot.data()!;
        return UserModel.fromMap({...data, 'id': id}); //Chuyển dữ liệu theo model để quản lý
      } catch (e) {}
    }
    ```
  - Cập nhật thông tin người dùng:
    ```dart 
    // Cập nhật thông tin người dùng bằng UserModel
    Future<void> updateDetails(UserModel user) async {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.id)
            .update(user.toMap()); // Chuyển model thành Map
      } catch (e) {}
    }
    ```
  - Xoá thông tin người dùng:
    ```dart
    Future<void> deleteUsers(String id) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .delete();
    }
    ```

    ***MUSIC:*** Để tạo mới bài hát tích hợp firebase và model thì chúng ta thực hiện theo câu lệnh sau
  - Tạo bài hát mới:
    ```dart
     //Thêm bài hát
    Future addSongDetails(
    MusicModel songs, String id, Uint8List? imageFile) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('music/song_ava/$id.png');
      await storageRef.putData(imageFile!);
      await FirebaseFirestore.instance
          .collection('music')
          .doc(id)
          .set(songs.toMap());
      } catch (e) {}
    }
    ```
  - Cập nhật thông tin bài hát:
    ```dart
    Future<void> updateDetails(MusicModel song) async {
      try {
        await FirebaseFirestore.instance
            .collection('music')
            .doc(song.id)
            .update(song.toMap()); // Chuyển model thành Map
      } catch (e) {}
    }
    ```
  - Lấy dữ liệu bài hát:
    ```dart
    //Lấy ảnh và file nhạc của bài hát trong Storage
    Future<String?> getImageUrl(String imagePath) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(imagePath);
      final url =
          await ref.getDownloadURL(); //Lấy ảnh từ Firebase Storage
      return url;
      } catch (e) {
      return null; // Nếu không có ảnh, trả về null
      }
    }
    //Lấy thông tin của bài hát
    Future<List<MusicModel>> getAllSong() async {
    try {
      final snapshot = await _collection.get();
      return snapshot.docs.map((doc) {
          final data = doc.data();
          data['id'] = doc.id; // Gán id từ document ID
      return MusicModel.fromMap(data);
        }).toList();
      } catch (e) {
        return [];
      }
    } 
    ```
  - Xoá bài hát:
    ```dart
    Future deleteSong(
      String id, String songFilePath) async {
    try {
      // Xóa file trong Firebase Storage
      final storageRef = FirebaseStorage.instance.ref().child(songFilePath);
      await storageRef.delete();
      // Xóa bài hát trong Firestore
      await _collection.doc(id).delete();
      } catch (e) {}
    }
    ```
  Còn đối với ***Playlist*** và ***Event*** chúng ta làm tương tự đầy đủ các thao tác CRUD cho 2 đối tượng này.

#### Bước 4: Kiểm thử

1. Kiểm thử tự động
 - Với kiểm thử tự động, firebase hỗ trợ khá ít cho việc kiểm thử với flutter và dart và hầu như không có tài liệu. Gây ra nhiều khó khăn cho việc kiểm thử và gần như không thể thực hiện kiểm thử đơn vị hay UI, UX được.
 - Cho nên đối với việc kiểm thử chỉ có thể thực hiện với các model để kiểm tra xem các trường dữ liệu có đúng khi đưa lên firebase được hay không
 - Thực hiện kiểm thử bằng cách gõ lệnh vào terminal như sau:
 
    ```bash
    flutter test
    ```
2. Screenshots hoặc video demo về ứng dụng và quá trình kiểm thử tự động.
 - Kiểm thử tự động:
 
    ![](assets/flutterTest.png)

 - Video demo về ứng dụng và kiểm thử thủ công: Bạn có thể truy cập theo đường dẫn để xem video demo về ứng dụng `assets/FlutterDemo.mp4` hoặc truy cập theo đường link sau: https://drive.google.com/drive/folders/1uTn03-lnGC1GlQ8pHB8lAWGMmLeHwbtR?usp=drive_link

## Tự đánh giá điểm: 9/10
