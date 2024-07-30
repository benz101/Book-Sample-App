// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_of_book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemOfBookModelAdapter extends TypeAdapter<ItemOfBookModel> {
  @override
  final int typeId = 0;

  @override
  ItemOfBookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemOfBookModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      authors: (fields[2] as List?)?.cast<Author>(),
      translators: (fields[3] as List?)?.cast<Author>(),
      subjects: (fields[4] as List?)?.cast<String>(),
      bookshelves: (fields[5] as List?)?.cast<String>(),
      languages: (fields[6] as List?)?.cast<String>(),
      copyright: fields[7] as bool?,
      mediaType: fields[8] as String?,
      formats: fields[9] as Formats?,
      downloadCount: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemOfBookModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.authors)
      ..writeByte(3)
      ..write(obj.translators)
      ..writeByte(4)
      ..write(obj.subjects)
      ..writeByte(5)
      ..write(obj.bookshelves)
      ..writeByte(6)
      ..write(obj.languages)
      ..writeByte(7)
      ..write(obj.copyright)
      ..writeByte(8)
      ..write(obj.mediaType)
      ..writeByte(9)
      ..write(obj.formats)
      ..writeByte(10)
      ..write(obj.downloadCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemOfBookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuthorAdapter extends TypeAdapter<Author> {
  @override
  final int typeId = 1;

  @override
  Author read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Author(
      name: fields[0] as String?,
      birthYear: fields[1] as int?,
      deathYear: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Author obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthYear)
      ..writeByte(2)
      ..write(obj.deathYear);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FormatsAdapter extends TypeAdapter<Formats> {
  @override
  final int typeId = 2;

  @override
  Formats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Formats(
      textHtml: fields[0] as String?,
      applicationEpubZip: fields[1] as String?,
      applicationXMobipocketEbook: fields[2] as String?,
      applicationRdfXml: fields[3] as String?,
      imageJpeg: fields[4] as String?,
      textPlainCharsetUsAscii: fields[5] as String?,
      applicationOctetStream: fields[6] as String?,
      textHtmlCharsetUtf8: fields[7] as String?,
      textPlainCharsetUtf8: fields[8] as String?,
      textPlainCharsetIso88591: fields[9] as String?,
      textHtmlCharsetIso88591: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Formats obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.textHtml)
      ..writeByte(1)
      ..write(obj.applicationEpubZip)
      ..writeByte(2)
      ..write(obj.applicationXMobipocketEbook)
      ..writeByte(3)
      ..write(obj.applicationRdfXml)
      ..writeByte(4)
      ..write(obj.imageJpeg)
      ..writeByte(5)
      ..write(obj.textPlainCharsetUsAscii)
      ..writeByte(6)
      ..write(obj.applicationOctetStream)
      ..writeByte(7)
      ..write(obj.textHtmlCharsetUtf8)
      ..writeByte(8)
      ..write(obj.textPlainCharsetUtf8)
      ..writeByte(9)
      ..write(obj.textPlainCharsetIso88591)
      ..writeByte(10)
      ..write(obj.textHtmlCharsetIso88591);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
