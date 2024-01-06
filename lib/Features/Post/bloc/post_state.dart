part of 'post_bloc.dart';

@immutable
abstract class PostState {}
abstract class PostActionState extends PostState {}

class PostInitial extends PostState {}

class PostLoadingState extends PostState {}

class PostFetchSuccessfulState extends PostState{
  final List<PostModel> posts;
  PostFetchSuccessfulState(this.posts);
}

class PostErrorState extends PostState {}

