// To parse this JSON data, do
//
//     final listOfBookResponse = listOfBookResponseFromJson(jsonString);

import 'dart:convert';

ListOfBookResponse listOfBookResponseFromJson(String str) => ListOfBookResponse.fromJson(json.decode(str));

String listOfBookResponseToJson(ListOfBookResponse data) => json.encode(data.toJson());

class ListOfBookResponse {
    int? count;
    String? next;
    dynamic previous;
    List<ItemOfBook>? results;

    ListOfBookResponse({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory ListOfBookResponse.fromJson(Map<String, dynamic> json) => ListOfBookResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<ItemOfBook>.from(json["results"]!.map((x) => ItemOfBook.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class ItemOfBook {
    int? id;
    String? title;
    List<Author>? authors;
    List<Author>? translators;
    List<String>? subjects;
    List<String>? bookshelves;
    List<String>? languages;
    bool? copyright;
    String? mediaType;
    Formats? formats;
    int? downloadCount;

    ItemOfBook({
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

    factory ItemOfBook.fromJson(Map<String, dynamic> json) => ItemOfBook(
        id: json["id"],
        title: json["title"],
        authors: json["authors"] == null ? [] : List<Author>.from(json["authors"]!.map((x) => Author.fromJson(x))),
        translators: json["translators"] == null ? [] : List<Author>.from(json["translators"]!.map((x) => Author.fromJson(x))),
        subjects: json["subjects"] == null ? [] : List<String>.from(json["subjects"]!.map((x) => x)),
        bookshelves: json["bookshelves"] == null ? [] : List<String>.from(json["bookshelves"]!.map((x) => x)),
        languages: json["languages"] == null ? [] : List<String>.from(json["languages"]!.map((x) => x as String)),
        copyright: json["copyright"],
        mediaType: json["media_type"],
        formats: json["formats"] == null ? null : Formats.fromJson(json["formats"]),
        downloadCount: json["download_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "authors": authors == null ? [] : List<dynamic>.from(authors!.map((x) => x.toJson())),
        "translators": translators == null ? [] : List<dynamic>.from(translators!.map((x) => x.toJson())),
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
        "bookshelves": bookshelves == null ? [] : List<dynamic>.from(bookshelves!.map((x) => x)),
        "languages": languages == null ? [] : List<dynamic>.from(languages!.map((x) => x)),
        "copyright": copyright,
        "media_type": mediaType,
        "formats": formats?.toJson(),
        "download_count": downloadCount,
    };
}

class Author {
    String? name;
    int? birthYear;
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

class Formats {
    String? textHtml;
    String? applicationEpubZip;
    String? applicationXMobipocketEbook;
    String? applicationRdfXml;
    String? imageJpeg;
    String? textPlainCharsetUsAscii;
    String? applicationOctetStream;
    String? textHtmlCharsetUtf8;
    String? textPlainCharsetUtf8;
    String? textPlainCharsetIso88591;
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
