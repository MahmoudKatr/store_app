import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_services_product.dart';
import 'package:store_app/widget/custom_button.dart';
import 'package:store_app/widget/custom_text_field.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({super.key});
  static String id = 'update-page';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? productName, desc, image, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Update Page',
                style: TextStyle(color: Colors.black)),
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  CustomFormTextField(
                    hintText: 'Product Name',
                    onChanged: (value) {
                      productName = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    hintText: 'Description',
                    onChanged: (value) {
                      desc = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    inputType: TextInputType.number,
                    hintText: 'Price',
                    onChanged: (value) {
                      price = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomFormTextField(
                    hintText: 'Image',
                    onChanged: (value) {
                      image = value;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButon(
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                        await UpdateProduct(product);
                        print("Success!");
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                    text: "Update",
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> UpdateProduct(ProductModel product) async {
    await UpdateProductServices().UpdateProduct(
        productId: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price : price.toString()!,
        description: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
