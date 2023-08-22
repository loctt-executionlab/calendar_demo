// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_account_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$googleSignInHash() => r'6586f3856b65576794bd1863ee21dae88a95b595';

/// See also [googleSignIn].
@ProviderFor(googleSignIn)
final googleSignInProvider = Provider<GoogleSignIn>.internal(
  googleSignIn,
  name: r'googleSignInProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$googleSignInHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoogleSignInRef = ProviderRef<GoogleSignIn>;
String _$onGoogleAccountChangeHash() =>
    r'e46bfa51e4d0be54f6036850565f424ceaecb918';

/// See also [onGoogleAccountChange].
@ProviderFor(onGoogleAccountChange)
final onGoogleAccountChangeProvider =
    AutoDisposeProvider<BehaviorSubject<GoogleSignInAccount?>>.internal(
  onGoogleAccountChange,
  name: r'onGoogleAccountChangeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onGoogleAccountChangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OnGoogleAccountChangeRef
    = AutoDisposeProviderRef<BehaviorSubject<GoogleSignInAccount?>>;
String _$gCalendarApiHash() => r'a3c381772bdb25fcf020f8123197999260da85ac';

/// See also [GCalendarApi].
@ProviderFor(GCalendarApi)
final gCalendarApiProvider =
    AutoDisposeNotifierProvider<GCalendarApi, CalendarApi?>.internal(
  GCalendarApi.new,
  name: r'gCalendarApiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gCalendarApiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GCalendarApi = AutoDisposeNotifier<CalendarApi?>;
String _$googleSignInNotifierHash() =>
    r'8ac0009b84aa27d845b3524f3505799a11ee3f11';

/// See also [GoogleSignInNotifier].
@ProviderFor(GoogleSignInNotifier)
final googleSignInNotifierProvider =
    AutoDisposeNotifierProvider<GoogleSignInNotifier, GoogleSignIn>.internal(
  GoogleSignInNotifier.new,
  name: r'googleSignInNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$googleSignInNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GoogleSignInNotifier = AutoDisposeNotifier<GoogleSignIn>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
