import 'dart:convert';
import 'dart:js_interop';

import 'package:bloc_sample_code/Features/Post/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostRepository{
  static Future<List<PostModel>> getPost()async{

    var client=http.Client();
    List<PostModel> post=[];

    try{

      var response=await client.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      List data=jsonDecode(response.body.toString());
      if(response.statusCode==200){

        for(Map i in data){
          post.add(PostModel.fromJson(i as Map<String,dynamic>));
        }
      }
      print("-----------Right---------");
      return post;
    }
    catch(e){


      print("-----------Wrong---------");
      print(e.toString());

      return [];
    }
  }
}