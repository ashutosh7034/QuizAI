// File: lib/models/category.dart

class Category {
  final String name;
  final String imageUrl;
  final bool isAsset;

  Category({
    required this.name,
    required this.imageUrl,
    this.isAsset = false,
  });
}