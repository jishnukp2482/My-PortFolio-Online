class HomeState {
  final bool isLoading;
  final int body;

  HomeState({
    required this.isLoading,
    required this.body,
  });

  factory HomeState.initial() => HomeState(isLoading: false, body: 0);

  HomeState copyWith({
    bool? isLoading,
    int? body,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      body: body ?? this.body,
    );
  }
}
