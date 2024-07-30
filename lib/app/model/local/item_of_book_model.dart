import 'package:hive/hive.dart';
part 'item_of_book_model.g.dart';

@HiveType(typeId: 0)
class ItemOfBookModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  List<Author>? authors;

  @HiveField(3)
  List<Author>? translators;

  @HiveField(4)
  List<String>? subjects;

  @HiveField(5)
  List<String>? bookshelves;

  @HiveField(6)
  List<String>? languages;

  @HiveField(7)
  bool? copyright;

  @HiveField(8)
  String? mediaType;

  @HiveField(9)
  Formats? formats;

  @HiveField(10)
  int? downloadCount;

  ItemOfBookModel({
    this.id,
    this.title,
    this.authors,
    this.translators,
    this.subjects,
    this.bookshelves,
    this.languages,
    this.copyright,
    this.mediaType,
    this.formats,
    this.downloadCount,
  });

  factory ItemOfBookModel.fromJson(Map<String, dynamic> json) =>
      ItemOfBookModel(
        id: json["id"],
        title: json["title"],
        authors: json["authors"] == null
            ? []
            : List<Author>.from(
                json["authors"]!.map((x) => Author.fromJson(x))),
        translators: json["translators"] == null
            ? []
            : List<Author>.from(
                json["translators"]!.map((x) => Author.fromJson(x))),
        subjects: json["subjects"] == null
            ? []
            : List<String>.from(json["subjects"]!.map((x) => x)),
        bookshelves: json["bookshelves"] == null
            ? []
            : List<String>.from(json["bookshelves"]!.map((x) => x)),
        languages: json["languages"] == null
            ? []
            : List<String>.from(json["languages"]!.map((x) => x as String)),
        copyright: json["copyright"],
        mediaType: json["media_type"],
        formats:
            json["formats"] == null ? null : Formats.fromJson(json["formats"]),
        downloadCount: json["download_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "authors": authors == null
            ? []
            : List<dynamic>.from(authors!.map((x) => x.toJson())),
        "translators": translators == null
            ? []
            : List<dynamic>.from(translators!.map((x) => x.toJson())),
        "subjects":
            subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
        "bookshelves": bookshelves == null
            ? []
            : List<dynamic>.from(bookshelves!.map((x) => x)),
        "languages": languages == null
            ? []
            : List<dynamic>.from(languages!.map((x) => x)),
        "copyright": copyright,
        "media_type": mediaType,
        "formats": formats?.toJson(),
        "download_count": downloadCount,
      };
}

@HiveType(typeId: 1)
class Author {
  @HiveField(0)
  String? name;

  @HiveField(1)
  int? birthYear;

  @HiveField(2)
  int? deathYear;

  Author({
    this.name,
    this.birthYear,
    this.deathYear,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        birthYear: json["birth_year"],
        deathYear: json["death_year"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "birth_year": birthYear,
        "death_year": deathYear,
      };
}

@HiveType(typeId: 2)
class Formats {
  @HiveField(0)
  String? textHtml;

  @HiveField(1)
  String? applicationEpubZip;

  @HiveField(2)
  String? applicationXMobipocketEbook;

  @HiveField(3)
  String? applicationRdfXml;

  @HiveField(4)
  String? imageJpeg;

  @HiveField(5)
  String? textPlainCharsetUsAscii;

  @HiveField(6)
  String? applicationOctetStream;

  @HiveField(7)
  String? textHtmlCharsetUtf8;

  @HiveField(8)
  String? textPlainCharsetUtf8;

  @HiveField(9)
  String? textPlainCharsetIso88591;

  @HiveField(10)
  String? textHtmlCharsetIso88591;

  Formats({
    this.textHtml,
    this.applicationEpubZip,
    this.applicationXMobipocketEbook,
    this.applicationRdfXml,
    this.imageJpeg,
    this.textPlainCharsetUsAscii,
    this.applicationOctetStream,
    this.textHtmlCharsetUtf8,
    this.textPlainCharsetUtf8,
    this.textPlainCharsetIso88591,
    this.textHtmlCharsetIso88591,
  });

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        textHtml: json["text/html"],
        applicationEpubZip: json["application/epub+zip"],
        applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
        applicationRdfXml: json["application/rdf+xml"],
        imageJpeg: json["image/jpeg"],
        textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
        applicationOctetStream: json["application/octet-stream"],
        textHtmlCharsetUtf8: json["text/html; charset=utf-8"],
        textPlainCharsetUtf8: json["text/plain; charset=utf-8"],
        textPlainCharsetIso88591: json["text/plain; charset=iso-8859-1"],
        textHtmlCharsetIso88591: json["text/html; charset=iso-8859-1"],
      );

  Map<String, dynamic> toJson() => {
        "text/html": textHtml,
        "application/epub+zip": applicationEpubZip,
        "application/x-mobipocket-ebook": applicationXMobipocketEbook,
        "application/rdf+xml": applicationRdfXml,
        "image/jpeg": imageJpeg,
        "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
        "application/octet-stream": applicationOctetStream,
        "text/html; charset=utf-8": textHtmlCharsetUtf8,
        "text/plain; charset=utf-8": textPlainCharsetUtf8,
        "text/plain; charset=iso-8859-1": textPlainCharsetIso88591,
        "text/html; charset=iso-8859-1": textHtmlCharsetIso88591,
      };
}
