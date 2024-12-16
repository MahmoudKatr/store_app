import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductServices {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      URL: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'category': category,
        'image': image,
        'description': description,
      },
    );

    // Convert the response to a ProductModel and return it
    return ProductModel.fromJson(data);
  }
}
