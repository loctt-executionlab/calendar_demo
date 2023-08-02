// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_account_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$googleSignInHash() => r'e50fff5bf481aefccd615512a967f183ab9c861c';

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
String _$gCalendarApiHash() => r'54be22dac7905f80ef5aa552fc29f228c69dd6b6';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
