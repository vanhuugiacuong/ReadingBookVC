class Book {
  String title;
  String author;
  String genre;
  String publicationDate;
  String isbn;
  String imageUrl;

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.publicationDate,
    required this.isbn,
    required this.imageUrl,
  });

  //Constructors mặc định
  Book.defaultConstructor()
    : title = '',
      author = '',
      genre = '',
      publicationDate = '',
      isbn = '',
      imageUrl = '';

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'genre': genre,
      'publicationDate': publicationDate,
      'isbn': isbn,
      'imageUrl': imageUrl,
    };
  }

  // Tạo từ JSON
  factory Book.fromJson(Map<String, dynamic> json) => Book(
    title: json['title'],
    author: json['author'],
    genre: json['genre'],
    publicationDate: json['publicationDate'],
    isbn: json['isbn'],
    imageUrl: json['imageUrl'],
  );
}

class BookList extends Book {
  int id;
  bool isReading;
  double progress;

  BookList({
    required this.id,
    required this.isReading,
    required this.progress,
    required String title,
    required String author,
    required String genre,
    required String publicationDate,
    required String isbn,
    required String imageUrl,
  }) : super(
         title: title,
         author: author,
         genre: genre,
         publicationDate: publicationDate,
         isbn: isbn,
         imageUrl: imageUrl,
       );
  // Tạo từ JSON
  factory BookList.fromJson(Map<String, dynamic> json) => BookList(
    id: json['id'],
    title: json['title'],
    author: json['author'],
    genre: json['genre'],
    publicationDate: json['publicationDate'],
    isbn: json['isbn'],
    imageUrl: json['imageUrl'],
    isReading: json['isReading'] ?? false,
    progress: (json['progress'] ?? 0.0).toDouble(),
  );

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['id'] = id;
    json['isReading'] = isReading;
    json['progress'] = progress;
    return json;
  }

  // Đánh dấu sách là đang đọc
  void startReading() {
    isReading = true;
    progress = 0.0; // Bắt đầu từ đầu
  }

  // Cập nhật tiến độ đọc
  void updateProgress(double newProgress) {
    if (newProgress >= 0.0 && newProgress <= 1.0) {
      progress = newProgress;
    }
  }

  // Đánh dấu sách là đã đọc xong
  void finishReading() {
    isReading = false;
    progress = 1.0; // Đặt tiến độ là 100%
  }
}
