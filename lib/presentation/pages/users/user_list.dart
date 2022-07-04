import 'dart:developer';

import 'package:shimmer/shimmer.dart';

import '../../../core/utils/colors.dart';
import '../profile.dart';
import '../../bloc/user/user_bloc.dart';
import '../../bloc/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Users is Loaded')));
        }
      }),
      builder: (context, state) {
        if (state is UserEmptyState) {
          return const Center(
            child: Text(
              'No data received. Please button "Load"',
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        if (state is UserLoadingState) {
          return getShimmerLoading();
        }

        if (state is UserLoadedState) {
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 18,
            ),
            padding: const EdgeInsets.all(16),
            itemCount: state.loadedUser.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        company: state.loadedUser[index].company.name,
                        address: state.loadedUser[index].address.street,
                        name: state.loadedUser[index].name,
                        email: state.loadedUser[index].email,
                        web_site: state.loadedUser[index].website,
                        phone_number: state.loadedUser[index].phone,
                      ),
                    ),
                  );
                },
                leading: icon(),
                title: Text(
                  state.loadedUser[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          );
        }

        if (state is UserErrorState) {
          return const Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

Shimmer getShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: Colors.white,
    highlightColor: Colors.white70,
    child: ListView.separated(
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 18,
      ),
      padding: const EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: icon(),
          title: const Text(
            '',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },
    ),
  );
}

Icon icon() {
  return const Icon(
    Icons.person,
    size: 16,
    color: Color(0xFF979797),
  );
}

AppBar appBar() {
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: appbarColor,
        ),
      ),
    ),
    elevation: 0,
    title: const Text(
      'Contacts',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Raleway',
      ),
    ),
    centerTitle: true,
  );
}
