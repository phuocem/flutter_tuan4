
import 'package:flutter/material.dart';
import 'package:flutter_tuan4/modles/store_modle.dart';
import 'package:flutter_tuan4/widgets/custom_product_card.dart';

class  HomePage extends StatelessWidget {
  HomePage({super.key});

  static  final List<Course> data = [
    Course(
        id: "c1",
        title: "Flutter for Beginners",
        imageUrl: 'https://i.ytimg.com/vi/BiOSCpV-lts/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLA5qKA4khoqGOrzqRfpDHkNsdr2Sw',
        description: "Học cách xây dựng ứng dụng Flutter từ cơ bản đến nâng cao.",
        instructor: "Nguyễn Văn A",
        durationMinutes: 240,
        tags: ["flutter", "mobile", "beginner"]
    ),
    Course(
        id: "c2",
        title: "Advanced Flutter",
        imageUrl: 'https://multigenesys.com/wp-content/uploads/2025/02/Advanced-Techniques-for-Dealing-with-Accidental-Multiple-Taps-in-Flutter-Apps.png',
        description: "Khám phá các tính năng nâng cao của Flutter.",
        instructor: "Nguyễn Văn B",
        durationMinutes: 180,
        tags: ["flutter", "mobile", "advanced"]
    ),

    Course(
      id: "c3",
      title: "Dart Programming",
      imageUrl:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUwFBnMNUN1Pue-IKwL0wX4JhRmmj4JjuOfg&s' ,
      description: "Học ngôn ngữ lập trình Dart.",
      instructor: "Nguyễn Văn C",
      durationMinutes: 120,
      tags: ["dart", "programming", "beginner"]
    ),
    Course(
      id: "c4",
      title: "Web Development with Flutter",
      imageUrl: 'https://miro.medium.com/v2/resize:fit:1024/1*wxoy5YscxLPFayqBF8hwOQ.png',
      description: "Xây dựng ứng dụng web với Flutter.",
      instructor: "Nguyễn Văn D",
      durationMinutes: 300,
      tags: ["flutter", "web", "development"]
    ),
    Course(
      id: "c6",
      title: "UI/UX Design with Flutter",
      imageUrl: 'https://www.whitelotuscorporation.com/wp-content/uploads/2023/05/Flutter-UI-Design-Creating-Stunning-Interfaces-with-Flutters-Widgets.webp',
      description: "Thiết kế giao diện người dùng với Flutter.",
      instructor: "Nguyễn Văn F",
      durationMinutes: 200,
      tags: ["flutter", "ui", "ux"]
    ),
    Course(
      id: "c7",
      title: "Game Development with Flutter",
      imageUrl: 'https://static1.xdaimages.com/wordpress/wp-content/uploads/2021/12/Untitled3.jpg',
      description: "Phát triển trò chơi với Flutter.",
      instructor: "Nguyễn Văn G",
      durationMinutes: 250,
      tags: ["flutter", "game", "development"]
    ),
    Course(
      id: "c8",
      title: "Flutter for Web",
      imageUrl: 'https://hypersense-software.com/blog/wp-content/uploads/2023/07/Blog_post-1920x1080-Flutter-Web.jpg',
      description: "Học cách phát triển ứng dụng web với Flutter.",
      instructor: "Nguyễn Văn H",
      durationMinutes: 220,
      tags: ["flutter", "web", "development"]
    ),
    Course(
      id: "c9",
      title: "Flutter for Desktop",
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxT2xoWn4DJDpUy6pnNWwTbPVGM4P32OSIMA&s',
      description: "Học cách phát triển ứng dụng desktop với Flutter.",
      instructor: "Nguyễn Văn I",
      durationMinutes: 260,
      tags: ["flutter", "desktop", "development"]
    ),
    Course(
      id: "c10",
      title: "Flutter for Embedded Systems",
      imageUrl: 'https://media.licdn.com/dms/image/v2/D4D12AQFPXGdPxnQ27w/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1679024900009?e=2147483647&v=beta&t=kON1kOgLCDNcEyKoLEh73VcpiUYZtYMlJ8RkZOkL6cE',
      description: "Học cách phát triển ứng dụng nhúng với Flutter.",
      instructor: "Nguyễn Văn J",
      durationMinutes: 280,
      tags: ["flutter", "embedded", "development"]
    ),
    Course(
      id: "c11",
      title: "Flutter for IoT",
      imageUrl: 'https://media.licdn.com/dms/image/v2/D4D12AQHr123PUGQAbA/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1696828029914?e=2147483647&v=beta&t=i_w5FQ6ZLnzUfLtZWBy-0RUYklauOjzswDInTQnj2iA',
      description: "Học cách phát triển ứng dụng IoT với Flutter.",
      instructor: "Nguyễn Văn K",
      durationMinutes: 300,
      tags: ["flutter", "iot", "development"]
    ),
    Course(
      id: "c12",
      title: "Flutter for AR/VR",
      imageUrl: 'https://www.xavor.com/wp-content/uploads/2024/02/Leveraging-AR-VR-in-Flutter-Development.jpg',
      description: "Học cách phát triển ứng dụng AR/VR với Flutter.",
      instructor: "Nguyễn Văn L",
      durationMinutes: 320,
      tags: ["flutter", "ar", "vr"]
    ),
    Course(
      id: "c13",
      title: "Flutter for Blockchain",
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbxd5BrVqAOCaNFQrwZowrNEhcjldLsmmcDg&s',
      description: "Học cách phát triển ứng dụng blockchain với Flutter.",
      instructor: "Nguyễn Văn M",
      durationMinutes: 340,
      tags: ["flutter", "blockchain", "development"]
    ),
    Course(
      id: "c14",
      title: "Flutter for AI/ML",
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEg5TCKxkjC5G8VDRe7ybMJWpIsK4tCljIYg&s',
      description: "Học cách phát triển ứng dụng AI/ML với Flutter.",
      instructor: "Nguyễn Văn N",
      durationMinutes: 360,
      tags: ["flutter", "ai", "ml"]
    ),
    Course(
      id: "c15",
      title: "Flutter for Cloud Computing",
      imageUrl: 'https://i.ytimg.com/vi/AK1jmnveehA/maxresdefault.jpg',
      description: "Học cách phát triển ứng dụng điện toán đám mây với Flutter.",
      instructor: "Nguyễn Văn O",
      durationMinutes: 380,
      tags: ["flutter", "cloud", "computing"]
    ),
    Course(
      id: "c16",
      title: "Flutter for Big Data",
      imageUrl: 'https://i.ytimg.com/vi/q8UXj-44dk8/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLACnj7pAxuuyJBlbhUBlE2WRdVIMw',
      description: "Học cách phát triển ứng dụng big data với Flutter.",
      instructor: "Nguyễn Văn P",
      durationMinutes: 400,
      tags: ["flutter", "big", "data"]
    ),
    Course(
      id: "c17",
      title: "Flutter for Cybersecurity",
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqtdKsJoAA5-iJC0AyGXtMuRKq05pd0glZDQ&s',
      description: "Học cách phát triển ứng dụng an ninh mạng với Flutter.",
      instructor: "Nguyễn Văn Q",
      durationMinutes: 420,
      tags: ["flutter", "cybersecurity", "development"]
    )
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomProductCard(course: data[index]),
            );
          },
        ),
      ),
    );
  }
}