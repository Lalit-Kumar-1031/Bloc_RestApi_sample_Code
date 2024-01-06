import 'package:bloc_sample_code/Features/cart/cart_bloc.dart';
import 'package:bloc_sample_code/Features/cart/ui/carttile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Cart", style: TextStyle(color: Colors.white),),),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen:(previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is !CartActionState,
        listener: (context, state) {
        },
        builder: (context, state) {
          switch(state.runtimeType)
          {
            case CartSuccessState:
              final successState=state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(productDataModel: successState.cartItems[index], cartBloc: cartBloc);
                  },);
            default:

          }
          return Container();
        },
      ),
    );
  }
}
