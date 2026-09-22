abstract class MediaItem {
  String id;
  String title;
  double price;

  MediaItem(this.id, this.title, this.price);

  String getDetails();
}

mixin Downloadable {
  void download(String title) {
    print("Downloading $title...");
  }
}

class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook(
    String id,
    String title,
    double price,
    this.durationHours,
    this.narrator,
  ) : super(id, title, price);

  @override
  String getDetails() {
    return "$title - $durationHours hours - Narrator: $narrator - Price: $price";
  }
}

class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook(
    String id,
    String title,
    double price,
    this.fileSizeMB,
    this.author,
  ) : super(id, title, price);

  @override
  String getDetails() {
    return "$title - $fileSizeMB MB - Author: $author - Price: $price";
  }
}

class ShoppingCart {
  List<MediaItem> _items = [];

  void addItem(MediaItem item) {
    _items.add(item);
  }

  double calculateTotalWithTax({double taxRate = 0.12}) {
    double total = _items.fold(
      0,
      (sum, item) => sum + item.price,
    );

    double tax = total * taxRate;

    return total + tax;
  }

  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items
        .where((item) => item.price <= maxPrice)
        .toList();
  }

  void printReceipt() {
    print("===== RECEIPT =====");

    for (var item in _items) {
      print(item.getDetails());

      if (item is Downloadable) {
        Downloadable downloadable = item as Downloadable;
        downloadable.download(item.title);
      }
    }

    print("Total with tax: ${calculateTotalWithTax()}");
  }
}

void main() {
  Audiobook audiobook = Audiobook(
    "A001",
    "Harry Potter",
    5000,
    8.5,
    "Stephen Fry",
  );

  EBook ebook = EBook(
    "E001",
    "Clean Code",
    7000,
    4.5,
    "Robert Martin",
  );

  Audiobook audiobook2 = Audiobook(
    "A002",
    "The Hobbit",
    4000,
    11.0,
    "Andy Serkis",
  );

  ShoppingCart cart = ShoppingCart();

  cart.addItem(audiobook);
  cart.addItem(ebook);
  cart.addItem(audiobook2);

  cart.printReceipt();

  print("===== ITEMS UNDER 5000 =====");

  List<MediaItem> cheapItems = cart.filterByMaxPrice(5000);

  for (var item in cheapItems) {
    print(item.getDetails());
  }
}