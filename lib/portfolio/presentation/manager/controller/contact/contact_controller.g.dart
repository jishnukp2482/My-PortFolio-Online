// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ContactController)
const contactControllerProvider = ContactControllerProvider._();

final class ContactControllerProvider
    extends $NotifierProvider<ContactController, ContactState> {
  const ContactControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contactControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contactControllerHash();

  @$internal
  @override
  ContactController create() => ContactController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContactState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContactState>(value),
    );
  }
}

String _$contactControllerHash() => r'5ac8de1fbe0e405c6d987436cd976232c8e003ed';

abstract class _$ContactController extends $Notifier<ContactState> {
  ContactState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ContactState, ContactState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ContactState, ContactState>,
              ContactState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
