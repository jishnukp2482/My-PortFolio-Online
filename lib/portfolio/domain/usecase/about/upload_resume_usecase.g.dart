// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_resume_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getUploadResumeUseCase)
final getUploadResumeUseCaseProvider = GetUploadResumeUseCaseProvider._();

final class GetUploadResumeUseCaseProvider
    extends
        $FunctionalProvider<
          UploadResumeUseCase,
          UploadResumeUseCase,
          UploadResumeUseCase
        >
    with $Provider<UploadResumeUseCase> {
  GetUploadResumeUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getUploadResumeUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getUploadResumeUseCaseHash();

  @$internal
  @override
  $ProviderElement<UploadResumeUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UploadResumeUseCase create(Ref ref) {
    return getUploadResumeUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UploadResumeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UploadResumeUseCase>(value),
    );
  }
}

String _$getUploadResumeUseCaseHash() =>
    r'04f58179f03ac6576582c3a579c3c489af92cd8e';
