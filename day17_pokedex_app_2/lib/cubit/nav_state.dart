part of 'nav_cubit.dart';

abstract class NavState extends Equatable {
  const NavState();

  @override
  List<Object> get props => [];
}

class NavShowList extends NavState {}

class NavShowDetails extends NavState {
  final int id;

  NavShowDetails(this.id);
}
