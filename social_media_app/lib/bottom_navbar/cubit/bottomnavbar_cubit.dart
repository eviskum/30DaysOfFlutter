import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnavbar_state.dart';

class BottomnavbarCubit extends Cubit<BottomnavbarState> {
  BottomnavbarCubit() : super(BottomnavbarState(index: 0));

  void selectTab(int index) => emit(BottomnavbarState(index: index));
}
