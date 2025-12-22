class CategoryModel {
  final int id;
  final String documentId;
  final String name;
  final String? slug;

  CategoryModel({
    required this.id,
    required this.documentId,
    required this.name,
    this.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      documentId: json['documentId'] ?? '',
      name: json['name'] ?? 'Uncategorized',
      slug: json['slug'],
    );
  }
}