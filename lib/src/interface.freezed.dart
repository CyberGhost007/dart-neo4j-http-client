// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interface.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return _Response.fromJson(json);
}

/// @nodoc
mixin _$Response {
  List<Result>? get results => throw _privateConstructorUsedError;
  List<QueryError>? get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseCopyWith<Response> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseCopyWith<$Res> {
  factory $ResponseCopyWith(Response value, $Res Function(Response) then) =
      _$ResponseCopyWithImpl<$Res, Response>;
  @useResult
  $Res call({List<Result>? results, List<QueryError>? errors});
}

/// @nodoc
class _$ResponseCopyWithImpl<$Res, $Val extends Response>
    implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<QueryError>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory _$$_ResponseCopyWith(
          _$_Response value, $Res Function(_$_Response) then) =
      __$$_ResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Result>? results, List<QueryError>? errors});
}

/// @nodoc
class __$$_ResponseCopyWithImpl<$Res>
    extends _$ResponseCopyWithImpl<$Res, _$_Response>
    implements _$$_ResponseCopyWith<$Res> {
  __$$_ResponseCopyWithImpl(
      _$_Response _value, $Res Function(_$_Response) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$_Response(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
      errors: freezed == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<QueryError>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Response implements _Response {
  const _$_Response(
      {final List<Result>? results, final List<QueryError>? errors})
      : _results = results,
        _errors = errors;

  factory _$_Response.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseFromJson(json);

  final List<Result>? _results;
  @override
  List<Result>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<QueryError>? _errors;
  @override
  List<QueryError>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Response(results: $results, errors: $errors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Response &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseCopyWith<_$_Response> get copyWith =>
      __$$_ResponseCopyWithImpl<_$_Response>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseToJson(
      this,
    );
  }
}

abstract class _Response implements Response {
  const factory _Response(
      {final List<Result>? results,
      final List<QueryError>? errors}) = _$_Response;

  factory _Response.fromJson(Map<String, dynamic> json) = _$_Response.fromJson;

  @override
  List<Result>? get results;
  @override
  List<QueryError>? get errors;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseCopyWith<_$_Response> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  List<String>? get columns => throw _privateConstructorUsedError;
  List<Row>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call({List<String>? columns, List<Row>? data});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columns = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      columns: freezed == columns
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Row>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String>? columns, List<Row>? data});
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$_Result>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columns = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_Result(
      columns: freezed == columns
          ? _value._columns
          : columns // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Row>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result({final List<String>? columns, final List<Row>? data})
      : _columns = columns,
        _data = data;

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  final List<String>? _columns;
  @override
  List<String>? get columns {
    final value = _columns;
    if (value == null) return null;
    if (_columns is EqualUnmodifiableListView) return _columns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Row>? _data;
  @override
  List<Row>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Result(columns: $columns, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            const DeepCollectionEquality().equals(other._columns, _columns) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_columns),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result({final List<String>? columns, final List<Row>? data}) =
      _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  List<String>? get columns;
  @override
  List<Row>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}

Row _$RowFromJson(Map<String, dynamic> json) {
  return _Row.fromJson(json);
}

/// @nodoc
mixin _$Row {
  List<dynamic>? get row => throw _privateConstructorUsedError;
  List<dynamic>? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RowCopyWith<Row> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowCopyWith<$Res> {
  factory $RowCopyWith(Row value, $Res Function(Row) then) =
      _$RowCopyWithImpl<$Res, Row>;
  @useResult
  $Res call({List<dynamic>? row, List<dynamic>? meta});
}

/// @nodoc
class _$RowCopyWithImpl<$Res, $Val extends Row> implements $RowCopyWith<$Res> {
  _$RowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? row = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      row: freezed == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RowCopyWith<$Res> implements $RowCopyWith<$Res> {
  factory _$$_RowCopyWith(_$_Row value, $Res Function(_$_Row) then) =
      __$$_RowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? row, List<dynamic>? meta});
}

/// @nodoc
class __$$_RowCopyWithImpl<$Res> extends _$RowCopyWithImpl<$Res, _$_Row>
    implements _$$_RowCopyWith<$Res> {
  __$$_RowCopyWithImpl(_$_Row _value, $Res Function(_$_Row) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? row = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$_Row(
      row: freezed == row
          ? _value._row
          : row // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      meta: freezed == meta
          ? _value._meta
          : meta // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Row implements _Row {
  const _$_Row({final List<dynamic>? row, final List<dynamic>? meta})
      : _row = row,
        _meta = meta;

  factory _$_Row.fromJson(Map<String, dynamic> json) => _$$_RowFromJson(json);

  final List<dynamic>? _row;
  @override
  List<dynamic>? get row {
    final value = _row;
    if (value == null) return null;
    if (_row is EqualUnmodifiableListView) return _row;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _meta;
  @override
  List<dynamic>? get meta {
    final value = _meta;
    if (value == null) return null;
    if (_meta is EqualUnmodifiableListView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Row(row: $row, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Row &&
            const DeepCollectionEquality().equals(other._row, _row) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_row),
      const DeepCollectionEquality().hash(_meta));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RowCopyWith<_$_Row> get copyWith =>
      __$$_RowCopyWithImpl<_$_Row>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RowToJson(
      this,
    );
  }
}

abstract class _Row implements Row {
  const factory _Row({final List<dynamic>? row, final List<dynamic>? meta}) =
      _$_Row;

  factory _Row.fromJson(Map<String, dynamic> json) = _$_Row.fromJson;

  @override
  List<dynamic>? get row;
  @override
  List<dynamic>? get meta;
  @override
  @JsonKey(ignore: true)
  _$$_RowCopyWith<_$_Row> get copyWith => throw _privateConstructorUsedError;
}

QueryError _$QueryErrorFromJson(Map<String, dynamic> json) {
  return _QueryError.fromJson(json);
}

/// @nodoc
mixin _$QueryError {
  String get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryErrorCopyWith<QueryError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryErrorCopyWith<$Res> {
  factory $QueryErrorCopyWith(
          QueryError value, $Res Function(QueryError) then) =
      _$QueryErrorCopyWithImpl<$Res, QueryError>;
  @useResult
  $Res call({String code, String message});
}

/// @nodoc
class _$QueryErrorCopyWithImpl<$Res, $Val extends QueryError>
    implements $QueryErrorCopyWith<$Res> {
  _$QueryErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QueryErrorCopyWith<$Res>
    implements $QueryErrorCopyWith<$Res> {
  factory _$$_QueryErrorCopyWith(
          _$_QueryError value, $Res Function(_$_QueryError) then) =
      __$$_QueryErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String message});
}

/// @nodoc
class __$$_QueryErrorCopyWithImpl<$Res>
    extends _$QueryErrorCopyWithImpl<$Res, _$_QueryError>
    implements _$$_QueryErrorCopyWith<$Res> {
  __$$_QueryErrorCopyWithImpl(
      _$_QueryError _value, $Res Function(_$_QueryError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
  }) {
    return _then(_$_QueryError(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QueryError implements _QueryError {
  const _$_QueryError({required this.code, required this.message});

  factory _$_QueryError.fromJson(Map<String, dynamic> json) =>
      _$$_QueryErrorFromJson(json);

  @override
  final String code;
  @override
  final String message;

  @override
  String toString() {
    return 'QueryError(code: $code, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QueryError &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QueryErrorCopyWith<_$_QueryError> get copyWith =>
      __$$_QueryErrorCopyWithImpl<_$_QueryError>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QueryErrorToJson(
      this,
    );
  }
}

abstract class _QueryError implements QueryError {
  const factory _QueryError(
      {required final String code,
      required final String message}) = _$_QueryError;

  factory _QueryError.fromJson(Map<String, dynamic> json) =
      _$_QueryError.fromJson;

  @override
  String get code;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_QueryErrorCopyWith<_$_QueryError> get copyWith =>
      throw _privateConstructorUsedError;
}

DiscoveryResponse _$DiscoveryResponseFromJson(Map<String, dynamic> json) {
  return _DiscoveryResponse.fromJson(json);
}

/// @nodoc
mixin _$DiscoveryResponse {
  @JsonKey(name: 'neo4j_version')
  String? get neo4jVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'neo4j_edition')
  String? get neo4jEdition => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction')
  String? get transaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'bolt_direct')
  String? get boltDirect => throw _privateConstructorUsedError;
  @JsonKey(name: 'bolt_routing')
  String? get boltRouting => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscoveryResponseCopyWith<DiscoveryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoveryResponseCopyWith<$Res> {
  factory $DiscoveryResponseCopyWith(
          DiscoveryResponse value, $Res Function(DiscoveryResponse) then) =
      _$DiscoveryResponseCopyWithImpl<$Res, DiscoveryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'neo4j_version') String? neo4jVersion,
      @JsonKey(name: 'neo4j_edition') String? neo4jEdition,
      @JsonKey(name: 'transaction') String? transaction,
      @JsonKey(name: 'bolt_direct') String? boltDirect,
      @JsonKey(name: 'bolt_routing') String? boltRouting});
}

/// @nodoc
class _$DiscoveryResponseCopyWithImpl<$Res, $Val extends DiscoveryResponse>
    implements $DiscoveryResponseCopyWith<$Res> {
  _$DiscoveryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? neo4jVersion = freezed,
    Object? neo4jEdition = freezed,
    Object? transaction = freezed,
    Object? boltDirect = freezed,
    Object? boltRouting = freezed,
  }) {
    return _then(_value.copyWith(
      neo4jVersion: freezed == neo4jVersion
          ? _value.neo4jVersion
          : neo4jVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      neo4jEdition: freezed == neo4jEdition
          ? _value.neo4jEdition
          : neo4jEdition // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String?,
      boltDirect: freezed == boltDirect
          ? _value.boltDirect
          : boltDirect // ignore: cast_nullable_to_non_nullable
              as String?,
      boltRouting: freezed == boltRouting
          ? _value.boltRouting
          : boltRouting // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscoveryResponseCopyWith<$Res>
    implements $DiscoveryResponseCopyWith<$Res> {
  factory _$$_DiscoveryResponseCopyWith(_$_DiscoveryResponse value,
          $Res Function(_$_DiscoveryResponse) then) =
      __$$_DiscoveryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'neo4j_version') String? neo4jVersion,
      @JsonKey(name: 'neo4j_edition') String? neo4jEdition,
      @JsonKey(name: 'transaction') String? transaction,
      @JsonKey(name: 'bolt_direct') String? boltDirect,
      @JsonKey(name: 'bolt_routing') String? boltRouting});
}

/// @nodoc
class __$$_DiscoveryResponseCopyWithImpl<$Res>
    extends _$DiscoveryResponseCopyWithImpl<$Res, _$_DiscoveryResponse>
    implements _$$_DiscoveryResponseCopyWith<$Res> {
  __$$_DiscoveryResponseCopyWithImpl(
      _$_DiscoveryResponse _value, $Res Function(_$_DiscoveryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? neo4jVersion = freezed,
    Object? neo4jEdition = freezed,
    Object? transaction = freezed,
    Object? boltDirect = freezed,
    Object? boltRouting = freezed,
  }) {
    return _then(_$_DiscoveryResponse(
      neo4jVersion: freezed == neo4jVersion
          ? _value.neo4jVersion
          : neo4jVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      neo4jEdition: freezed == neo4jEdition
          ? _value.neo4jEdition
          : neo4jEdition // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction: freezed == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String?,
      boltDirect: freezed == boltDirect
          ? _value.boltDirect
          : boltDirect // ignore: cast_nullable_to_non_nullable
              as String?,
      boltRouting: freezed == boltRouting
          ? _value.boltRouting
          : boltRouting // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscoveryResponse implements _DiscoveryResponse {
  const _$_DiscoveryResponse(
      {@JsonKey(name: 'neo4j_version') this.neo4jVersion,
      @JsonKey(name: 'neo4j_edition') this.neo4jEdition,
      @JsonKey(name: 'transaction') this.transaction,
      @JsonKey(name: 'bolt_direct') this.boltDirect,
      @JsonKey(name: 'bolt_routing') this.boltRouting});

  factory _$_DiscoveryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DiscoveryResponseFromJson(json);

  @override
  @JsonKey(name: 'neo4j_version')
  final String? neo4jVersion;
  @override
  @JsonKey(name: 'neo4j_edition')
  final String? neo4jEdition;
  @override
  @JsonKey(name: 'transaction')
  final String? transaction;
  @override
  @JsonKey(name: 'bolt_direct')
  final String? boltDirect;
  @override
  @JsonKey(name: 'bolt_routing')
  final String? boltRouting;

  @override
  String toString() {
    return 'DiscoveryResponse(neo4jVersion: $neo4jVersion, neo4jEdition: $neo4jEdition, transaction: $transaction, boltDirect: $boltDirect, boltRouting: $boltRouting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscoveryResponse &&
            (identical(other.neo4jVersion, neo4jVersion) ||
                other.neo4jVersion == neo4jVersion) &&
            (identical(other.neo4jEdition, neo4jEdition) ||
                other.neo4jEdition == neo4jEdition) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction) &&
            (identical(other.boltDirect, boltDirect) ||
                other.boltDirect == boltDirect) &&
            (identical(other.boltRouting, boltRouting) ||
                other.boltRouting == boltRouting));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, neo4jVersion, neo4jEdition,
      transaction, boltDirect, boltRouting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscoveryResponseCopyWith<_$_DiscoveryResponse> get copyWith =>
      __$$_DiscoveryResponseCopyWithImpl<_$_DiscoveryResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscoveryResponseToJson(
      this,
    );
  }
}

abstract class _DiscoveryResponse implements DiscoveryResponse {
  const factory _DiscoveryResponse(
          {@JsonKey(name: 'neo4j_version') final String? neo4jVersion,
          @JsonKey(name: 'neo4j_edition') final String? neo4jEdition,
          @JsonKey(name: 'transaction') final String? transaction,
          @JsonKey(name: 'bolt_direct') final String? boltDirect,
          @JsonKey(name: 'bolt_routing') final String? boltRouting}) =
      _$_DiscoveryResponse;

  factory _DiscoveryResponse.fromJson(Map<String, dynamic> json) =
      _$_DiscoveryResponse.fromJson;

  @override
  @JsonKey(name: 'neo4j_version')
  String? get neo4jVersion;
  @override
  @JsonKey(name: 'neo4j_edition')
  String? get neo4jEdition;
  @override
  @JsonKey(name: 'transaction')
  String? get transaction;
  @override
  @JsonKey(name: 'bolt_direct')
  String? get boltDirect;
  @override
  @JsonKey(name: 'bolt_routing')
  String? get boltRouting;
  @override
  @JsonKey(ignore: true)
  _$$_DiscoveryResponseCopyWith<_$_DiscoveryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
