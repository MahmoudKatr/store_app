import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllCategoryByName {
  Future<List<ProductModel>> getAllByCategory(String categoryName) async {
    List<dynamic> data = await Api()
        .get(URL: "https://fakestoreapi.com/products/category/$categoryName");

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }

    return productsList;
  }
}