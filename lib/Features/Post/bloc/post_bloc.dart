import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample_code/Features/Post/Repository/post_repository.dart';
import 'package:bloc_sample_code/Features/Post/model/post_model.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(PostInitialFetchEvent event, Emitter<PostState> emit) async{
    emit(PostLoadingState());
     List<PostModel> posts = await PostRepository.getPost();
     emit(PostFetchSuccessfulState(posts));

  }
}
