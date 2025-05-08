import 'package:flutter/material.dart';
import 'package:readingbookapp/models/book_model.dart';
import 'package:readingbookapp/sections/reading_progress_section.dart';
import 'package:readingbookapp/sections/redcommend_section.dart';
import 'package:readingbookapp/widgets/custom_bottom_nav.dart';

List<Book> bookList = [
  Book(
    title: 'The Hobbit',
    author: 'J.R.R. Tolkien',
    genre: 'Fantasy',
    publicationDate: '1937',
    isbn: '978-0547928227',
    imageUrl: 'https://m.media-amazon.com/images/I/81uEDUfKBZL.jpg',
  ),
  Book(
    title: '1984',
    author: 'George Orwell',
    genre: 'Dystopian',
    publicationDate: '1949',
    isbn: '978-0451524935',
    imageUrl:
        'https://m.media-amazon.com/images/I/81qZ5kGMQ1L._AC_UF1000,1000_QL80_.jpg',
  ),
  Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    genre: 'Classic',
    publicationDate: '1960',
    isbn: '978-0061120084',
    imageUrl: 'https://m.media-amazon.com/images/I/71FxgtFKcQL.jpg',
  ),
  Book(
    title: 'Harry Potter and the Sorcerer\'s Stone',
    author: 'J.K. Rowling',
    genre: 'Fantasy',
    publicationDate: '1997',
    isbn: '978-0439708180',
    imageUrl:
        'https://m.media-amazon.com/images/I/819GoteowlL._UF1000,1000_QL80_.jpg',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomNav(
      currentIndex: 0, // Chỉ mục của trang Home
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row để chia phần Text và Avatar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Cường!',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Find your best book',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        // Avatar ở bên phải
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                            'assets/images/IMG20230331200402.jpg',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // SearchBar
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Books...',
                        suffixIcon: const Icon(
                          Icons.search_outlined,
                          size: 30,
                        ), // Icon ở bên phải
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero, // Không bo góc
                          borderSide: BorderSide(color: Colors.black), // Viền đen
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: Colors.blueGrey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        filled: false,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Đang đọc
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: ReadingProgressSection(
                book: bookList[1], // lấy sách đang đọc
                progress: 0.50, // phần trăm đã đọc
              ),
            ),
            // Section 2: Gợi ý sách
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: RedcommendSection(books: bookList),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
