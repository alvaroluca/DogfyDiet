// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'birth_date_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BirthDateState {

 int? get selectedYear; int? get selectedMonth; List<int> get years; List<int> get months;
/// Create a copy of BirthDateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BirthDateStateCopyWith<BirthDateState> get copyWith => _$BirthDateStateCopyWithImpl<BirthDateState>(this as BirthDateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BirthDateState&&(identical(other.selectedYear, selectedYear) || other.selectedYear == selectedYear)&&(identical(other.selectedMonth, selectedMonth) || other.selectedMonth == selectedMonth)&&const DeepCollectionEquality().equals(other.years, years)&&const DeepCollectionEquality().equals(other.months, months));
}


@override
int get hashCode => Object.hash(runtimeType,selectedYear,selectedMonth,const DeepCollectionEquality().hash(years),const DeepCollectionEquality().hash(months));

@override
String toString() {
  return 'BirthDateState(selectedYear: $selectedYear, selectedMonth: $selectedMonth, years: $years, months: $months)';
}


}

/// @nodoc
abstract mixin class $BirthDateStateCopyWith<$Res>  {
  factory $BirthDateStateCopyWith(BirthDateState value, $Res Function(BirthDateState) _then) = _$BirthDateStateCopyWithImpl;
@useResult
$Res call({
 int? selectedYear, int? selectedMonth, List<int> years, List<int> months
});




}
/// @nodoc
class _$BirthDateStateCopyWithImpl<$Res>
    implements $BirthDateStateCopyWith<$Res> {
  _$BirthDateStateCopyWithImpl(this._self, this._then);

  final BirthDateState _self;
  final $Res Function(BirthDateState) _then;

/// Create a copy of BirthDateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedYear = freezed,Object? selectedMonth = freezed,Object? years = null,Object? months = null,}) {
  return _then(_self.copyWith(
selectedYear: freezed == selectedYear ? _self.selectedYear : selectedYear // ignore: cast_nullable_to_non_nullable
as int?,selectedMonth: freezed == selectedMonth ? _self.selectedMonth : selectedMonth // ignore: cast_nullable_to_non_nullable
as int?,years: null == years ? _self.years : years // ignore: cast_nullable_to_non_nullable
as List<int>,months: null == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [BirthDateState].
extension BirthDateStatePatterns on BirthDateState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BirthDateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BirthDateState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BirthDateState value)  $default,){
final _that = this;
switch (_that) {
case _BirthDateState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BirthDateState value)?  $default,){
final _that = this;
switch (_that) {
case _BirthDateState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? selectedYear,  int? selectedMonth,  List<int> years,  List<int> months)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BirthDateState() when $default != null:
return $default(_that.selectedYear,_that.selectedMonth,_that.years,_that.months);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? selectedYear,  int? selectedMonth,  List<int> years,  List<int> months)  $default,) {final _that = this;
switch (_that) {
case _BirthDateState():
return $default(_that.selectedYear,_that.selectedMonth,_that.years,_that.months);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? selectedYear,  int? selectedMonth,  List<int> years,  List<int> months)?  $default,) {final _that = this;
switch (_that) {
case _BirthDateState() when $default != null:
return $default(_that.selectedYear,_that.selectedMonth,_that.years,_that.months);case _:
  return null;

}
}

}

/// @nodoc


class _BirthDateState implements BirthDateState {
  const _BirthDateState({this.selectedYear, this.selectedMonth, required final  List<int> years, required final  List<int> months}): _years = years,_months = months;
  

@override final  int? selectedYear;
@override final  int? selectedMonth;
 final  List<int> _years;
@override List<int> get years {
  if (_years is EqualUnmodifiableListView) return _years;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_years);
}

 final  List<int> _months;
@override List<int> get months {
  if (_months is EqualUnmodifiableListView) return _months;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_months);
}


/// Create a copy of BirthDateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BirthDateStateCopyWith<_BirthDateState> get copyWith => __$BirthDateStateCopyWithImpl<_BirthDateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BirthDateState&&(identical(other.selectedYear, selectedYear) || other.selectedYear == selectedYear)&&(identical(other.selectedMonth, selectedMonth) || other.selectedMonth == selectedMonth)&&const DeepCollectionEquality().equals(other._years, _years)&&const DeepCollectionEquality().equals(other._months, _months));
}


@override
int get hashCode => Object.hash(runtimeType,selectedYear,selectedMonth,const DeepCollectionEquality().hash(_years),const DeepCollectionEquality().hash(_months));

@override
String toString() {
  return 'BirthDateState(selectedYear: $selectedYear, selectedMonth: $selectedMonth, years: $years, months: $months)';
}


}

/// @nodoc
abstract mixin class _$BirthDateStateCopyWith<$Res> implements $BirthDateStateCopyWith<$Res> {
  factory _$BirthDateStateCopyWith(_BirthDateState value, $Res Function(_BirthDateState) _then) = __$BirthDateStateCopyWithImpl;
@override @useResult
$Res call({
 int? selectedYear, int? selectedMonth, List<int> years, List<int> months
});




}
/// @nodoc
class __$BirthDateStateCopyWithImpl<$Res>
    implements _$BirthDateStateCopyWith<$Res> {
  __$BirthDateStateCopyWithImpl(this._self, this._then);

  final _BirthDateState _self;
  final $Res Function(_BirthDateState) _then;

/// Create a copy of BirthDateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedYear = freezed,Object? selectedMonth = freezed,Object? years = null,Object? months = null,}) {
  return _then(_BirthDateState(
selectedYear: freezed == selectedYear ? _self.selectedYear : selectedYear // ignore: cast_nullable_to_non_nullable
as int?,selectedMonth: freezed == selectedMonth ? _self.selectedMonth : selectedMonth // ignore: cast_nullable_to_non_nullable
as int?,years: null == years ? _self._years : years // ignore: cast_nullable_to_non_nullable
as List<int>,months: null == months ? _self._months : months // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
