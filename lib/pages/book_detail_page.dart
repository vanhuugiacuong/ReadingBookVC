import 'package:flutter/material.dart';
import 'package:readingbookapp/models/book_model.dart';
import 'package:readingbookapp/widgets/book_detail_card.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70), // Chiều cao AppBar
        child: Padding(
          padding: const EdgeInsets.all(16), // Thêm khoảng cách phía trên
          child: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: const Text('Book Detail'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  // Thực hiện hành động khi nhấn nút "Thêm vào yêu thích"
                },
                icon: const Icon(Icons.bookmark_outline),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: BookDetailCard(
          book: book,
        ),
      )
    );
  }
}