import 'package:test_app/presentation/pages/gallery/gallery_list.dart';
import '../../../core/utils/colors.dart';
import '../../../services/gallery/gallery_repository.dart';
import '../../bloc/gallery/gallery_bloc.dart';
import '../../bloc/gallery/gallery_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GalleryListRepository(),
      child: BlocProvider(
        create: (context) =>
            GalleryBloc(galleryRepository: context.read<GalleryListRepository>())
              ..add(GalleryLoadEvent()),
        child: Scaffold(
          backgroundColor: bodybgColor,
          appBar: appBar(),
          body: const GalleryListScreen(),
        ),
      ),
    );
  }
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
      'Gallery',
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