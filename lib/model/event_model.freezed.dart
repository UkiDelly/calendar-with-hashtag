// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarEventModel {
// required String id,
  String get title => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String? get description =>
      throw _privateConstructorUsedError; // required Account account,
// required Repeat repeat,
// required Alarm alarm,
  bool get allDay => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarEventModelCopyWith<CalendarEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventModelCopyWith<$Res> {
  factory $CalendarEventModelCopyWith(
          CalendarEventModel value, $Res Function(CalendarEventModel) then) =
      _$CalendarEventModelCopyWithImpl<$Res, CalendarEventModel>;
  @useResult
  $Res call(
      {String title,
      DateTime startTime,
      DateTime endTime,
      String? description,
      bool allDay,
      String? memo});
}

/// @nodoc
class _$CalendarEventModelCopyWithImpl<$Res, $Val extends CalendarEventModel>
    implements $CalendarEventModelCopyWith<$Res> {
  _$CalendarEventModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? description = freezed,
    Object? allDay = null,
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      allDay: null == allDay
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarEventModelCopyWith<$Res>
    implements $CalendarEventModelCopyWith<$Res> {
  factory _$$_CalendarEventModelCopyWith(_$_CalendarEventModel value,
          $Res Function(_$_CalendarEventModel) then) =
      __$$_CalendarEventModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      DateTime startTime,
      DateTime endTime,
      String? description,
      bool allDay,
      String? memo});
}

/// @nodoc
class __$$_CalendarEventModelCopyWithImpl<$Res>
    extends _$CalendarEventModelCopyWithImpl<$Res, _$_CalendarEventModel>
    implements _$$_CalendarEventModelCopyWith<$Res> {
  __$$_CalendarEventModelCopyWithImpl(
      _$_CalendarEventModel _value, $Res Function(_$_CalendarEventModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? description = freezed,
    Object? allDay = null,
    Object? memo = freezed,
  }) {
    return _then(_$_CalendarEventModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      allDay: null == allDay
          ? _value.allDay
          : allDay // ignore: cast_nullable_to_non_nullable
              as bool,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CalendarEventModel implements _CalendarEventModel {
  _$_CalendarEventModel(
      {required this.title,
      required this.startTime,
      required this.endTime,
      this.description,
      required this.allDay,
      this.memo});

// required String id,
  @override
  final String title;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String? description;
// required Account account,
// required Repeat repeat,
// required Alarm alarm,
  @override
  final bool allDay;
  @override
  final String? memo;

  @override
  String toString() {
    return 'CalendarEventModel(title: $title, startTime: $startTime, endTime: $endTime, description: $description, allDay: $allDay, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarEventModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.allDay, allDay) || other.allDay == allDay) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, startTime, endTime, description, allDay, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarEventModelCopyWith<_$_CalendarEventModel> get copyWith =>
      __$$_CalendarEventModelCopyWithImpl<_$_CalendarEventModel>(
          this, _$identity);
}

abstract class _CalendarEventModel implements CalendarEventModel {
  factory _CalendarEventModel(
      {required final String title,
      required final DateTime startTime,
      required final DateTime endTime,
      final String? description,
      required final bool allDay,
      final String? memo}) = _$_CalendarEventModel;

  @override // required String id,
  String get title;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String? get description;
  @override // required Account account,
// required Repeat repeat,
// required Alarm alarm,
  bool get allDay;
  @override
  String? get memo;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarEventModelCopyWith<_$_CalendarEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}
