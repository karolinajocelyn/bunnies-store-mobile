import 'dart:convert';

// Fungsi untuk mengonversi JSON string ke List<ProductEntry>
List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
    json.decode(str).map((x) => ProductEntry.fromJson(x)));

// Fungsi untuk mengonversi List<ProductEntry> ke JSON string
String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// Model utama untuk ProductEntry
class ProductEntry {
  String id;
  String artistName;
  String albumTitle;
  int price;
  String description;
  int user;

  ProductEntry({
    required this.id,
    required this.artistName,
    required this.albumTitle,
    required this.price,
    required this.description,
    required this.user,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        artistName: json["artist_name"],
        albumTitle: json["album_title"],
        price: json["price"],
        description: json["description"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "artist_name": artistName,
        "album_title": albumTitle,
        "price": price,
        "description": description,
        "user": user,
      };
}
