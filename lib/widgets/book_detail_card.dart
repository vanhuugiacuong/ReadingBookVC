import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:readingbookapp/models/book_model.dart';

class BookDetailCard extends StatelessWidget {
  final Book book;

  const BookDetailCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Book cover
          ClipRRect(
            child: Image.network(
              book.imageUrl, // Lấy ảnh từ đối tượng Book
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  color: Colors.grey,
                ); // Hiển thị icon nếu ảnh không tải được
              },
            ),
          ),
          const SizedBox(height: 16),

          // Title
          Text(
            book.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          // Author
          Text(book.author, style: TextStyle(fontSize: 14, color: Colors.grey)),

          const SizedBox(height: 12),
          // Info row
          Container(
            // padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Genre
                Column(
                  children: [
                    const Text(
                      'Genre',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.genre,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                // Publication Date
                Column(
                  children: [
                    const Text(
                      'Published',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      book.publicationDate,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),

                // ISBN
                Column(
                  children: [
                    const Text(
                      'Rating',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 30,
                          color: Colors.yellow,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '4.6',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
