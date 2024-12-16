import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductServices {
  Future<ProductModel> UpdateProduct({
    required int productId,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().put(
      URL: 'https://fakestoreapi.com/products/$productId',
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
