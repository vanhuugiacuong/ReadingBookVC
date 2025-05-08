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
