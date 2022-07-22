import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:pagination/bloc/Network/dio_helper.dart';
import 'package:pagination/bloc/cubit/posts_cubit.dart';
import 'package:pagination/bloc/home_screen.dart';
import 'package:pagination/getx/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // for bloc => Remove the double slash

      // home: BlocProvider(
      //     create: (BuildContext context) => PostsCubit()..getPosts(isFirst: true),
      //     child: const HomeScreen()),

      home: GetScreen(),
    );
  }
}
