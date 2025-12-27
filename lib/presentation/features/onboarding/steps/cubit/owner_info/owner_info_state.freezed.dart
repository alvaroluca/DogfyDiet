// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OwnerInfoState {

 String get name; String get location;
/// Create a copy of OwnerInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerInfoStateCopyWith<OwnerInfoState> get copyWith => _$OwnerInfoStateCopyWithImpl<OwnerInfoState>(this as OwnerInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerInfoState&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,name,location);

@override
String toString() {
  return 'OwnerInfoState(name: $name, location: $location)';
}


}

/// @nodoc
abstract mixin class $OwnerInfoStateCopyWith<$Res>  {
  factory $OwnerInfoStateCopyWith(OwnerInfoState value, $Res Function(OwnerInfoState) _then) = _$OwnerInfoStateCopyWithImpl;
@useResult
$Res call({
 String name, String location
});




}
/// @nodoc
class _$OwnerInfoStateCopyWithImpl<$Res>
    implements $OwnerInfoStateCopyWith<$Res> {
  _$OwnerInfoStateCopyWithImpl(this._self, this._then);

  final OwnerInfoState _self;
  final $Res Function(OwnerInfoState) _then;

/// Create a copy of OwnerInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? location = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OwnerInfoState].
extension OwnerInfoStatePatterns on OwnerInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OwnerInfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OwnerInfoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OwnerInfoState value)  $default,){
final _that = this;
switch (_that) {
case _OwnerInfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OwnerInfoState value)?  $default,){
final _that = this;
switch (_that) {
case _OwnerInfoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OwnerInfoState() when $default != null:
return $default(_that.name,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String location)  $default,) {final _that = this;
switch (_that) {
case _OwnerInfoState():
return $default(_that.name,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String location)?  $default,) {final _that = this;
switch (_that) {
case _OwnerInfoState() when $default != null:
return $default(_that.name,_that.location);case _:
  return null;

}
}

}

/// @nodoc


class _OwnerInfoState implements OwnerInfoState {
  const _OwnerInfoState({required this.name, required this.location});
  

@override final  String name;
@override final  String location;

/// Create a copy of OwnerInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerInfoStateCopyWith<_OwnerInfoState> get copyWith => __$OwnerInfoStateCopyWithImpl<_OwnerInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OwnerInfoState&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,name,location);

@override
String toString() {
  return 'OwnerInfoState(name: $name, location: $location)';
}


}

/// @nodoc
abstract mixin class _$OwnerInfoStateCopyWith<$Res> implements $OwnerInfoStateCopyWith<$Res> {
  factory _$OwnerInfoStateCopyWith(_OwnerInfoState value, $Res Function(_OwnerInfoState) _then) = __$OwnerInfoStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String location
});




}
/// @nodoc
class __$OwnerInfoStateCopyWithImpl<$Res>
    implements _$OwnerInfoStateCopyWith<$Res> {
  __$OwnerInfoStateCopyWithImpl(this._self, this._then);

  final _OwnerInfoState _self;
  final $Res Function(_OwnerInfoState) _then;

/// Create a copy of OwnerInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? location = null,}) {
  return _then(_OwnerInfoState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
