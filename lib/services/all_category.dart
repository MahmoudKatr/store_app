import 'package:store_app/helper/api.dart';

class AllCatergoryService {
  Future<List<dynamic>> getAllCatergory() async {
    List<dynamic> data =
        await Api().get(URL: "https://fakestoreapi.com/products/categories");

    return data;
  }
}
