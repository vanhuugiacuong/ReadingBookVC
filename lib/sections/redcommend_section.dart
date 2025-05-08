import 'package:flutter/material.dart';
import 'package:readingbookapp/models/book_model.dart';

class RedcommendSection extends StatelessWidget {
  final List<Book> books;

  const RedcommendSection({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & See More
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Redcommend for you',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'See More',
                style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              ),
            ],
          ),
        ),

        // List of books
        SizedBox(
          height: 260, // Đặt chiều cao cố định
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(2, 6),
                    ),
                  ],
                ),
                width: 140,
                margin: const EdgeInsets.only(right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Image.network(
                      book.imageUrl,
                      width: 140,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 8,
                    ), // Thêm khoảng cách giữa ảnh và text
                    // Title
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1, // Giới hạn số dòng
                      overflow:
                          TextOverflow
                              .ellipsis, // Thêm dấu "..." nếu text quá dài
                    ),
                    // Author
                    Text(
                      book.author,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blueGrey,
                      ),
                      maxLines: 1, // Giới hạn số dòng
                      overflow:
                          TextOverflow
                              .ellipsis, // Thêm dấu "..." nếu text quá dài
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
