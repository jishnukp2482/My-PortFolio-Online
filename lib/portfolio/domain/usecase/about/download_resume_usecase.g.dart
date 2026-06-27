// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_resume_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getDownloadUsecase)
const getDownloadUsecaseProvider = GetDownloadUsecaseProvider._();

final class GetDownloadUsecaseProvider
    extends
        $FunctionalProvider<
          DownloadResumeUseCase,
          DownloadResumeUseCase,
          DownloadResumeUseCase
        >
    with $Provider<DownloadResumeUseCase> {
  const GetDownloadUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getDownloadUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getDownloadUsecaseHash();

  @$internal
  @override
  $ProviderElement<DownloadResumeUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DownloadResumeUseCase create(Ref ref) {
    return getDownloadUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DownloadResumeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DownloadResumeUseCase>(value),
    );
  }
}

String _$getDownloadUsecaseHash() =>
    r'0246b0d07b6fc36ef0c788b595a906f1f86cced4';
