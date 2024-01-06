import 'package:bloc_sample_code/Features/home/home_bloc.dart';
import 'package:bloc_sample_code/Features/home/models/product_data_model.dart';
import 'package:flutter/material.dart';

class ProductWidegt extends StatefulWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  ProductWidegt({Key? key, required this.productDataModel, required this.homeBloc}) : super(key: key);

  @override
  State<ProductWidegt> createState() => _ProductWidegtState();
}

class _ProductWidegtState extends State<ProductWidegt> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.deepOrange,width: 2)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.productDataModel.img_url,),
                fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(height: 20,),
          Text(widget.productDataModel.name,style: TextStyle(fontWeight: FontWeight.bold),),
          Text(widget.productDataModel.description),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$'+widget.productDataModel.price,style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        widget.homeBloc.add(HomeProductWishlistButtonClickedEvent(productClicked: widget.productDataModel));
                      },
                      icon: Icon(Icons.favorite_outline_sharp)),
                  IconButton(
                      onPressed: () {
                        widget.homeBloc.add(HomeProductCartButtonClickedEvent(productClicked: widget.productDataModel));

                      },
                      icon:Icon(Icons.shopping_cart_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );

  }
}
