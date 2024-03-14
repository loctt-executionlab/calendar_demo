// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_calendar_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deviceCalendarNotifierHash() =>
    r'cc2926f010726c85728049677fc66142e742ddaf';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DeviceCalendarNotifier
    extends BuildlessAutoDisposeNotifier<DeviceCalendarData> {
  late final DeviceCalendarRepo repo;

  DeviceCalendarData build(
    DeviceCalendarRepo repo,
  );
}

/// See also [DeviceCalendarNotifier].
@ProviderFor(DeviceCalendarNotifier)
const deviceCalendarNotifierProvider = DeviceCalendarNotifierFamily();

/// See also [DeviceCalendarNotifier].
class DeviceCalendarNotifierFamily extends Family<DeviceCalendarData> {
  /// See also [DeviceCalendarNotifier].
  const DeviceCalendarNotifierFamily();

  /// See also [DeviceCalendarNotifier].
  DeviceCalendarNotifierProvider call(
    DeviceCalendarRepo repo,
  ) {
    return DeviceCalendarNotifierProvider(
      repo,
    );
  }

  @override
  DeviceCalendarNotifierProvider getProviderOverride(
    covariant DeviceCalendarNotifierProvider provider,
  ) {
    return call(
      provider.repo,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deviceCalendarNotifierProvider';
}

/// See also [DeviceCalendarNotifier].
class DeviceCalendarNotifierProvider extends AutoDisposeNotifierProviderImpl<
    DeviceCalendarNotifier, DeviceCalendarData> {
  /// See also [DeviceCalendarNotifier].
  DeviceCalendarNotifierProvider(
    DeviceCalendarRepo repo,
  ) : this._internal(
          () => DeviceCalendarNotifier()..repo = repo,
          from: deviceCalendarNotifierProvider,
          name: r'deviceCalendarNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deviceCalendarNotifierHash,
          dependencies: DeviceCalendarNotifierFamily._dependencies,
          allTransitiveDependencies:
              DeviceCalendarNotifierFamily._allTransitiveDependencies,
          repo: repo,
        );

  DeviceCalendarNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.repo,
  }) : super.internal();

  final DeviceCalendarRepo repo;

  @override
  DeviceCalendarData runNotifierBuild(
    covariant DeviceCalendarNotifier notifier,
  ) {
    return notifier.build(
      repo,
    );
  }

  @override
  Override overrideWith(DeviceCalendarNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: DeviceCalendarNotifierProvider._internal(
        () => create()..repo = repo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        repo: repo,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<DeviceCalendarNotifier, DeviceCalendarData>
      createElement() {
    return _DeviceCalendarNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeviceCalendarNotifierProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeviceCalendarNotifierRef
    on AutoDisposeNotifierProviderRef<DeviceCalendarData> {
  /// The parameter `repo` of this provider.
  DeviceCalendarRepo get repo;
}

class _DeviceCalendarNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<DeviceCalendarNotifier,
        DeviceCalendarData> with DeviceCalendarNotifierRef {
  _DeviceCalendarNotifierProviderElement(super.provider);

  @override
  DeviceCalendarRepo get repo =>
      (origin as DeviceCalendarNotifierProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
