import 'package:potfolio/portfolio/presentation/manager/controller/home/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeState build() {
    return HomeState.initial();
  }

  void selectBody(int body) {
    state = state.copyWith(body: body);
  }
}
