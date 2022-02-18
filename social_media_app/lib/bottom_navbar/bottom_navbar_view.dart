import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/bottom_navbar/cubit/bottomnavbar_cubit.dart';
import 'package:social_media_app/home/home_navigator.dart';
import 'package:social_media_app/home/home_view.dart';
import 'package:social_media_app/profile/profile_view.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomnavbarCubit>(
      create: (context) => BottomnavbarCubit(),
      child: BlocBuilder<BottomnavbarCubit, BottomnavbarState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index,
              onTap: (index) {
                context.read<BottomnavbarCubit>().selectTab(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
            body: IndexedStack(
              index: state.index,
              children: [
                HomeNavigator(),
                ProfileView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
