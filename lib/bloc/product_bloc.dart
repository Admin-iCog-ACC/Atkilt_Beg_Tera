// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:retailer_app/models/Product.dart';
// import 'package:retailer_app/repo/product_repo.dart';
// import 'package:retailer_app/services/api_services.dart';
// import 'package:bloc/bloc.dart';

// class ProductBloc extends Bloc<ProductEvent, ProductState> {
//   final ProductRepository productRepository;

//   ProductBloc({required this.productRepository})
//       : assert(productRepository != null),
//         super(null);

//   @override
//   Stream<ProductState> mapEventToState(ProductEvent event) async* {
//     ProductStateData data = ProductStateData();
//     if (event is ProductStartEvent) {
//       data = getStatedata(event.categoryId);
//       yield ProductLoadedState(
//         isLoading = false;
//         showSortBy = false;
//         data: data);
//       );
//       )}
//       else if(event is ProdcutChangeSortByEvent){
// ProductLoadedState state = this.state as ProductLoadedState;
// yield state.copyWith(sortBy: event.sortby, showSortBy: false);
//       }else if(event is ProductShowSortByEvent){
// ProductLoadedState state = this.state as ProductLoadedState;
// yield state.copyWith(showSortBy: false);
//       }
//     }
//   }


// @immutable
// class ProductInitialState extends ProductState{}

// @immutable
// class ProductLoadedState extends ProductState{
//   final ProductStateData? data;
//   final bool? isLoading;
//   final bool? showSortBy;
//   final String? sortBy;

//   ProductLoadedState({this.data, this.isLoading, this.showSortBy, this.sortBy});


//   ProductLoadedState copyWith({
//     ProductStateData? data,
//     bool? isLoading,
//     bool? showSortBy,
//     String? sortBy,
//   }) {
//     return ProductLoadedState(
//       data: data ?? this.data,
//       isLoading: isLoading ?? this.isLoading,
//       showSortBy: showSortBy ?? this.showSortBy,
//       sortBy: sortBy ?? this.sortBy,
//     );
//   }

// @override
// bool get stringify => true;

// @override
// List<Object> get props => [data, isLoading!, showSortBy!, sortBy!];

// }



// class ProductState {
//   final List<Product>? products;

//   const ProductState({this.products});

//   factory ProductState.initial() => ProductState();
// }


// @immutable
// abstract class ProductEvent extends Equatable {
//   @override
//   List<Object> get props => [];
// }

// @immutable
// class ProductStartEvent extends ProductEvent {
//   final int categoryId;

//   ProductStartEvent({required this.categoryId});

//   @override
//   List<Object> get props => [categoryId];
// }

// @immutable
// class ProdcutChangeSortByEvent extends ProductEvent {
//   final String sortby;

//   ProdcutChangeSortByEvent({required this.sortby});

//   @override
//   List<Object> get props => [sortby];
// }

// @immutable
// class ProductShowSortByEvent extends ProductEvent {
//   @override
//   List<Object> get props => [];
// }