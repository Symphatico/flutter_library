// To parse this JSON data, do
//
//     final l = lFromMap(jsonString);

import 'dart:convert';

class BookModel {
  BookModel({
    required this.description,
    required this.links,
    required this.title,
    required this.covers,
    required this.subjects,
    required this.firstPublishDate,
  });

  Created description;
  List<Link> links=[];
  String title;
  List<int> covers=[];
  List<String> subjects=[];
  String firstPublishDate;


  factory BookModel.fromJson(String str) => BookModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BookModel.fromMap(Map<String, dynamic> json) => BookModel(
    description: Created.fromMap(json["description"]),
    links: json["links"]!=null? List<Link>.from(json["links"].map((x) => Link.fromMap(x))): [],
    title: json["title"],
    covers: List<int>.from(json["covers"].map((x) => x)),
    subjects: json["subjects"]!=null? List<String>.from(json["subjects"].map((x) => x)):[],
    firstPublishDate: json["first_publish_date"]!=null?json["first_publish_date"]:"Unknown",

  );

  Map<String, dynamic> toMap() => {
    "description": description.toMap(),
    "links": List<dynamic>.from(links.map((x) => x.toMap())),
    "title": title,
    "covers": List<dynamic>.from(covers.map((x) => x)),
    "subjects": List<dynamic>.from(subjects.map((x) => x)),
  };
}

class Author {
  Author({
    required this.author,
    required this.type,
  });

  Type author;
  Type type;

  factory Author.fromJson(String str) => Author.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Author.fromMap(Map<String, dynamic> json) => Author(
    author: Type.fromMap(json["author"]),
    type: Type.fromMap(json["type"]),
  );

  Map<String, dynamic> toMap() => {
    "author": author.toMap(),
    "type": type.toMap(),
  };
}

class Type {
  Type({
    required this.key,
  });

  String key;

  factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Type.fromMap(Map<String, dynamic> json) => Type(
    key: json["key"],
  );

  Map<String, dynamic> toMap() => {
    "key": key,
  };
}

class Created {
  Created({
    required this.type,
    required this.value,
  });

  String type;
  String value;

  factory Created.fromJson(String str) => Created.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Created.fromMap(Map<String, dynamic> json) => Created(
    type: json["type"],
    value: json["value"],
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "value": value,
  };
}

class Excerpt {
  Excerpt({
    required this.pages,
    required this.excerpt,
    required this.author,
    required this.comment,
  });

  String pages;
  String excerpt;
  Type author;
  String comment;

  factory Excerpt.fromJson(String str) => Excerpt.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Excerpt.fromMap(Map<String, dynamic> json) => Excerpt(
    pages: json["pages"] == null ? null : json["pages"],
    excerpt: json["excerpt"],
    author: Type.fromMap(json["author"]),
    comment: json["comment"] == null ? null : json["comment"],
  );

  Map<String, dynamic> toMap() => {
    "pages": pages == null ? null : pages,
    "excerpt": excerpt,
    "author": author.toMap(),
    "comment": comment == null ? null : comment,
  };
}

class Link {
  Link({
    required this.title,
    required this.url,
    required this.type,
  });

  String title;
  String url;
  Type type;

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
    title: json["title"],
    url: json["url"],
    type: Type.fromMap(json["type"]),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "url": url,
    "type": type.toMap(),
  };
}
