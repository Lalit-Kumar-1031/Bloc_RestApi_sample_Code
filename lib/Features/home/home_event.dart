part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistButtonClickedEvent extends HomeEvent{
  final ProductDataModel productClicked;
  HomeProductWishlistButtonClickedEvent({required this.productClicked});

}
class HomeProductCartButtonClickedEvent extends HomeEvent{
  final ProductDataModel productClicked;
  HomeProductCartButtonClickedEvent({required this.productClicked});

}

class HomeWishlistButtonNavigateEvent extends HomeEvent{

}
class HomeCartButtonNavigateEvent extends HomeEvent{

}
