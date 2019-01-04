class Joke {
  final String iconUrl;
  final String id;
  final String url;
  final String value;

  Joke({ this.iconUrl, this.id, this.url, this.value });
  
  @override
  bool operator ==(Object other) =>
    other is Joke &&
      id == other.id;

  @override
  int get hashCode =>
    id.hashCode;

  @override
  String toString() => value;

  Map<String, Object> toJson() => ({
    "icon_url": iconUrl,
    "id": id,
    "url": url,
    "value": value
  });

  static Joke fromJson(Object json) {
    Map<String, Object> data = json as Map<String, Object>;
    return Joke(
      iconUrl: data["json_url"],
      id: data["id"],
      url: data["url"],
      value: data["value"]
    );
  }

  static Joke empty() {
    return Joke(
      iconUrl: "",
      id: "",
      url: "",
      value: "",
    );
  }
}