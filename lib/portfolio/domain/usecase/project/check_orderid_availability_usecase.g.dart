// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_orderid_availability_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCheckOrderIDAvailabilityUsecase)
const getCheckOrderIDAvailabilityUsecaseProvider =
    GetCheckOrderIDAvailabilityUsecaseProvider._();

final class GetCheckOrderIDAvailabilityUsecaseProvider
    extends
        $FunctionalProvider<
          CheckOrderIDAvailabilityUsecase,
          CheckOrderIDAvailabilityUsecase,
          CheckOrderIDAvailabilityUsecase
        >
    with $Provider<CheckOrderIDAvailabilityUsecase> {
  const GetCheckOrderIDAvailabilityUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCheckOrderIDAvailabilityUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$getCheckOrderIDAvailabilityUsecaseHash();

  @$internal
  @override
  $ProviderElement<CheckOrderIDAvailabilityUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckOrderIDAvailabilityUsecase create(Ref ref) {
    return getCheckOrderIDAvailabilityUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckOrderIDAvailabilityUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckOrderIDAvailabilityUsecase>(
        value,
      ),
    );
  }
}

String _$getCheckOrderIDAvailabilityUsecaseHash() =>
    r'd64f52d05a68d4fad3e8ae6b18f3c67228982a47';
