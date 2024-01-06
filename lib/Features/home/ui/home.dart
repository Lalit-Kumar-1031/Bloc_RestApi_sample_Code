import 'package:bloc_sample_code/Features/cart/ui/Cart.dart';
import 'package:bloc_sample_code/Features/home/home_bloc.dart';
import 'package:bloc_sample_code/Features/home/ui/product_widget.dart';
import 'package:bloc_sample_code/Features/wishlist/ui/Wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
   homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    print('Build');
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      buildWhen: (previous, current) =>current is !HomeActionState,
       listenWhen: (previous, current) =>current is HomeActionState,
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Cart(),));
          }
       else if(state is HomeNavigateToWishlistPageActionState)
        {Navigator.push(context, MaterialPageRoute(builder: (context) => Wishlist(),));
        }
       else if(state is HomeProductItemsWishlistedActionState)
         {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product Wish listed")));
         }
        else if(state is HomeProductItemsCartedActionState)
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product Carted ")));
        }
      },
      builder: (context, state) {
       switch(state.runtimeType)
       {
         case HomeLoadingState:
           return Scaffold(
             body: Center(child: CircularProgressIndicator()),
           );
         case HomeLoadedSuccessState:
           final successState=state as HomeLoadedSuccessState;
           return Scaffold(
             appBar: AppBar(
               backgroundColor: Colors.deepOrange,
               title: Text('Grocery App',style: TextStyle(color: Colors.white),),
               actions: [
                 IconButton(
                     onPressed: () {
                       homeBloc.add(HomeWishlistButtonNavigateEvent());
                     },
                     icon: Icon(Icons.favorite_outline_sharp,color: Colors.white,)),
                 IconButton(
                     onPressed: () {
                       homeBloc.add(HomeCartButtonNavigateEvent());
                     },
                     icon: Icon(Icons.shopping_cart_outlined,color: Colors.white,)),
               ],
             ),
             body: ListView.builder(
               itemCount: successState.products.length,
               itemBuilder: (context, index) {
               return ProductWidegt(
                  homeBloc: homeBloc,
                   productDataModel:successState.products[index]);
             },),
           );
         case HomeErrorState:
           return Center(child: Text("Error "));
         default:
           return SizedBox();

       }
      },
    );
  }
}

/*
 return
 */