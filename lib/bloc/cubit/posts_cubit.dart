import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagination/bloc/Network/dio_helper.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  static PostsCubit get(context) => BlocProvider.of(context);
  int page = 0;
  List<dynamic> list = [];

  void getPosts({bool isFirst = false}) {
    emit(GetPostsLoadingState());
    DioHelper.getData(url: 'posts?_limit=4&_page=$page').then((value) {
      if (isFirst) {
        page = 0;
        list = value.data;
      } else {
        list.addAll(value.data);
      }
      page++;
      emit(GetPostsSuccessState());
      if (kDebugMode) {
        print('..............');
        print(value.data);
        print(page);
        print('..............');
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
