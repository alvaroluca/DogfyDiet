// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent()';
}


}

/// @nodoc
class $OnboardingEventCopyWith<$Res>  {
$OnboardingEventCopyWith(OnboardingEvent _, $Res Function(OnboardingEvent) __);
}


/// Adds pattern-matching-related methods to [OnboardingEvent].
extension OnboardingEventPatterns on OnboardingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadDogBreeds value)?  loadDogBreeds,TResult Function( LoadOnboardingData value)?  loadOnboardingData,TResult Function( UpdateBreed value)?  updateBreed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadDogBreeds() when loadDogBreeds != null:
return loadDogBreeds(_that);case LoadOnboardingData() when loadOnboardingData != null:
return loadOnboardingData(_that);case UpdateBreed() when updateBreed != null:
return updateBreed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadDogBreeds value)  loadDogBreeds,required TResult Function( LoadOnboardingData value)  loadOnboardingData,required TResult Function( UpdateBreed value)  updateBreed,}){
final _that = this;
switch (_that) {
case LoadDogBreeds():
return loadDogBreeds(_that);case LoadOnboardingData():
return loadOnboardingData(_that);case UpdateBreed():
return updateBreed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadDogBreeds value)?  loadDogBreeds,TResult? Function( LoadOnboardingData value)?  loadOnboardingData,TResult? Function( UpdateBreed value)?  updateBreed,}){
final _that = this;
switch (_that) {
case LoadDogBreeds() when loadDogBreeds != null:
return loadDogBreeds(_that);case LoadOnboardingData() when loadOnboardingData != null:
return loadOnboardingData(_that);case UpdateBreed() when updateBreed != null:
return updateBreed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadDogBreeds,TResult Function()?  loadOnboardingData,TResult Function( int breedId)?  updateBreed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadDogBreeds() when loadDogBreeds != null:
return loadDogBreeds();case LoadOnboardingData() when loadOnboardingData != null:
return loadOnboardingData();case UpdateBreed() when updateBreed != null:
return updateBreed(_that.breedId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadDogBreeds,required TResult Function()  loadOnboardingData,required TResult Function( int breedId)  updateBreed,}) {final _that = this;
switch (_that) {
case LoadDogBreeds():
return loadDogBreeds();case LoadOnboardingData():
return loadOnboardingData();case UpdateBreed():
return updateBreed(_that.breedId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadDogBreeds,TResult? Function()?  loadOnboardingData,TResult? Function( int breedId)?  updateBreed,}) {final _that = this;
switch (_that) {
case LoadDogBreeds() when loadDogBreeds != null:
return loadDogBreeds();case LoadOnboardingData() when loadOnboardingData != null:
return loadOnboardingData();case UpdateBreed() when updateBreed != null:
return updateBreed(_that.breedId);case _:
  return null;

}
}

}

/// @nodoc


class LoadDogBreeds implements OnboardingEvent {
  const LoadDogBreeds();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadDogBreeds);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.loadDogBreeds()';
}


}




/// @nodoc


class LoadOnboardingData implements OnboardingEvent {
  const LoadOnboardingData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadOnboardingData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OnboardingEvent.loadOnboardingData()';
}


}




/// @nodoc


class UpdateBreed implements OnboardingEvent {
  const UpdateBreed(this.breedId);
  

 final  int breedId;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBreedCopyWith<UpdateBreed> get copyWith => _$UpdateBreedCopyWithImpl<UpdateBreed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBreed&&(identical(other.breedId, breedId) || other.breedId == breedId));
}


@override
int get hashCode => Object.hash(runtimeType,breedId);

@override
String toString() {
  return 'OnboardingEvent.updateBreed(breedId: $breedId)';
}


}

/// @nodoc
abstract mixin class $UpdateBreedCopyWith<$Res> implements $OnboardingEventCopyWith<$Res> {
  factory $UpdateBreedCopyWith(UpdateBreed value, $Res Function(UpdateBreed) _then) = _$UpdateBreedCopyWithImpl;
@useResult
$Res call({
 int breedId
});




}
/// @nodoc
class _$UpdateBreedCopyWithImpl<$Res>
    implements $UpdateBreedCopyWith<$Res> {
  _$UpdateBreedCopyWithImpl(this._self, this._then);

  final UpdateBreed _self;
  final $Res Function(UpdateBreed) _then;

/// Create a copy of OnboardingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? breedId = null,}) {
  return _then(UpdateBreed(
null == breedId ? _self.breedId : breedId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
