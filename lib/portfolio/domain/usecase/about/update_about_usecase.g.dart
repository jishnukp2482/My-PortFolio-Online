// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_about_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUpdateAboutUseCase)
final getUpdateAboutUseCaseProvider = GetUpdateAboutUseCaseProvider._();

final class GetUpdateAboutUseCaseProvider
    extends
        $FunctionalProvider<
          UpdateAboutUseCase,
          UpdateAboutUseCase,
          UpdateAboutUseCase
        >
    with $Provider<UpdateAboutUseCase> {
  GetUpdateAboutUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUpdateAboutUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUpdateAboutUseCaseHash();

  @$internal
  @override
  $ProviderElement<UpdateAboutUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateAboutUseCase create(Ref ref) {
    return getUpdateAboutUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateAboutUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateAboutUseCase>(value),
    );
  }
}

String _$getUpdateAboutUseCaseHash() =>
    r'f51f83feceeca30707e98ea1adc003862540148c';
