class Book{
  String title;
  String author;
  double price;
  bool isBorrowed;

  Book(
    this.title,
    this.author,
    this.price,
    [
      this.isBorrowed=false,
    ]
  );
}

class Library{
  List<Book>_books=[];

  void addBook(Book book){
    _books.add(book);
  }

  List<Book>getAvaijableBooks(){
    return _books
    .where((book)=>)
  }
}