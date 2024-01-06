import 'package:bloc_sample_code/Features/Post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Post Screen"),
        centerTitle: true,
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen:(previous, current) => current is !PostActionState,
        listener: (context, state) {

        },
        builder: (context, state) {
          switch(state.runtimeType){
            case PostLoadingState:
              return CircularProgressIndicator();
            case PostErrorState:
              return Text("Error occured");
            case PostFetchSuccessfulState:
              final successState=state as PostFetchSuccessfulState;
              return Container(
                child: ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                 return ListTile(
                   leading: Text(successState.posts[index].id.toString()),
                   title: Text(successState.posts[index].title.toString()),
                 );
                },),
              );
            default:
              return Container(height: 200,width: 200,color: Colors.yellow,);
          }

        },
      ),
    );
  }
}
