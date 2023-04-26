// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Response _$$_ResponseFromJson(Map<String, dynamic> json) => _$_Response(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => QueryError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResponseToJson(_$_Response instance) =>
    <String, dynamic>{
      'results': instance.results,
      'errors': instance.errors,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      columns:
          (json['columns'] as List<dynamic>?)?.map((e) => e as String).toList(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Row.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'columns': instance.columns,
      'data': instance.data,
    };

_$_Row _$$_RowFromJson(Map<String, dynamic> json) => _$_Row(
      row: json['row'] as List<dynamic>?,
      meta: json['meta'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_RowToJson(_$_Row instance) => <String, dynamic>{
      'row': instance.row,
      'meta': instance.meta,
    };

_$_QueryError _$$_QueryErrorFromJson(Map<String, dynamic> json) =>
    _$_QueryError(
      code: json['code'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$_QueryErrorToJson(_$_QueryError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

_$_DiscoveryResponse _$$_DiscoveryResponseFromJson(Map<String, dynamic> json) =>
    _$_DiscoveryResponse(
      neo4jVersion: json['neo4j_version'] as String?,
      neo4jEdition: json['neo4j_edition'] as String?,
      transaction: json['transaction'] as String?,
      boltDirect: json['bolt_direct'] as String?,
      boltRouting: json['bolt_routing'] as String?,
    );

Map<String, dynamic> _$$_DiscoveryResponseToJson(
        _$_DiscoveryResponse instance) =>
    <String, dynamic>{
      'neo4j_version': instance.neo4jVersion,
      'neo4j_edition': instance.neo4jEdition,
      'transaction': instance.transaction,
      'bolt_direct': instance.boltDirect,
      'bolt_routing': instance.boltRouting,
    };
