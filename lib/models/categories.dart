class Categories {
  List<String> categories;

  Categories(this.categories);

  @override 
  int get hashCode =>
    categories
      .map((c) => c.hashCode)
      .reduce((acc, c) => acc ^ c);

  @override
  bool operator ==(Object other) =>
    other is Categories &&
      other.hashCode == hashCode;

  List<String> toJson() => categories;

  static Categories fromJson(Object json) {
    List<dynamic> data = json as List<dynamic>;
    return Categories(data.map((d) => d.toString()).toList());
  } 
}