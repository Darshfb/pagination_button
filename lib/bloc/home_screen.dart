import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination/bloc/cubit/posts_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = PostsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: TextButton(
                onPressed: () {
                  cubit.getPosts(isFirst: true);
                  print(cubit.list.length.toString());
                },
                child: const Text(
                  'Hi',
                  style: TextStyle(color: Colors.red),
                )),
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () {
                    cubit.getPosts();
                    print(cubit.list.length.toString());
                  },
                  child: const Text(
                    'Hi',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
          body: Column(
            children: [
              ConditionalBuilder(
                  condition: cubit.list.isNotEmpty,
                  builder: (context) => Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: cubit.list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.red,
                                    width: 300,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        cubit.list[index]['id'].toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(cubit.list[index]['title'].toString()),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                  fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      )),
                MaterialButton(
                  height: 45,
                  minWidth: double.infinity,
                  color: Colors.teal,
                  onPressed: () {
                    cubit.getPosts();
                  },
                  child: Text('Load More'),
                )
            ],
          ),
        );
      },
    );
  }
}
