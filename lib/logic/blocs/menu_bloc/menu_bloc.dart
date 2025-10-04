import 'package:flutter_bloc/flutter_bloc.dart';
import 'menu_event.dart';
import 'menu_state.dart';
import '../../../data/repository/menu_repository.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository repository;

  MenuBloc(this.repository) : super(MenuLoading()) {
    on<LoadMenu>((event, emit) async {
      try {
        final menu = await repository.fetchMenu(event.restaurantId);
        emit(MenuLoaded(menu));
      } catch (e) {
        emit(MenuError("Failed to load menu"));
      }
    });
  }
}
