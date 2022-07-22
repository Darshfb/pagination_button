part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class GetPostsSuccessState extends PostsState {}

class GetPostsLoadingState extends PostsState {}
