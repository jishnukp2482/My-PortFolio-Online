// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDioProvider)
final getDioProviderProvider = GetDioProviderProvider._();

final class GetDioProviderProvider
    extends $FunctionalProvider<DioProvider, DioProvider, DioProvider>
    with $Provider<DioProvider> {
  GetDioProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDioProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDioProviderHash();

  @$internal
  @override
  $ProviderElement<DioProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DioProvider create(Ref ref) {
    return getDioProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DioProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DioProvider>(value),
    );
  }
}

String _$getDioProviderHash() => r'c0f88f4c02c0f2f508189f61127524d0f7fc2183';
