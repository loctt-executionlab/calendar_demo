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
    r'b688af7413e1fcb4a6653d851990ba944c545204';

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
String _$gCalendarApiHash() => r'035afdc515834c414aacef6137775017889d287c';

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
