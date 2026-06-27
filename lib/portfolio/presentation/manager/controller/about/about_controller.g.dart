// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AboutController)
const aboutControllerProvider = AboutControllerProvider._();

final class AboutControllerProvider
    extends $NotifierProvider<AboutController, AboutState> {
  const AboutControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aboutControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aboutControllerHash();

  @$internal
  @override
  AboutController create() => AboutController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AboutState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AboutState>(value),
    );
  }
}

String _$aboutControllerHash() => r'8cfe69df83338758bf7e8795f5e6b764b8b02b92';

abstract class _$AboutController extends $Notifier<AboutState> {
  AboutState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AboutState, AboutState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AboutState, AboutState>,
              AboutState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
