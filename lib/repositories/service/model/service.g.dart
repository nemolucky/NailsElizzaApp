// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceAdapter extends TypeAdapter<Service> {
  @override
  final int typeId = 0;

  @override
  Service read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Service(
      label: fields[0] as String,
      description: fields[1] as String,
      price: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Service obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      label: json['label'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'label': instance.label,
      'description': instance.description,
      'price': instance.price,
    };
