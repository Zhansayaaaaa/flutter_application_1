class Book {
  String title;
  String author;
  double price;
  bool isBorrowed;

  Book(this.title, this.author, this.price, [this.isBorrowed = false]);
}

class Library {
  List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  List<Book> getAvailableBooks() {
    return _books.where((book) => book.isBorrowed == false).toList();
  }

  double getTotalValue() {
    return _books.fold(0, (sum, book) => sum + book.price);
  }
}

void main() {
  Library library = Library();

  Book book1 = Book("Harry Potter", "J.K. Rowling", 5000);
  Book book2 = Book("The Hobbit", "J.R.R. Tolkien", 4500, true);
  Book book3 = Book("Clean Code", "Robert Martin", 8000);
  Book book4 = Book("Atomic Habits", "James Clear", 6000);

  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);
  library.addBook(book4);

  print("Available books:");

  List<Book> availableBooks = library.getAvailableBooks();

  for (var book in availableBooks) {
    print("${book.title} - ${book.author} - ${book.price} ₸");
  }

  double total = library.getTotalValue();

  print("Total collection value: $total ₸");
}