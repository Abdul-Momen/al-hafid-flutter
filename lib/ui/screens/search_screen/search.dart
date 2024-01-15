import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/ui/screens/product_details_page/product_details.dart';
import 'package:alhafidh/ui/widgets/custom_img.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate {
  final ProductsController _productsCon = Get.find<ProductsController>();

  /* @override
  String get searchFieldLabel => 'What are you looking for?';*/

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }


  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    _productsCon.getSearchAllProducts(q: query);

    /* List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }*/
    return Obx(() {
      if (_productsCon.searchProductsLoading.value) {
        return Center(child: const CircularProgressIndicator());
      } else {
        if (_productsCon.productSearchList.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return SingleChildScrollView(
            child: SizedBox(
              height: 650.h,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.all(5),
                itemCount: _productsCon.productSearchList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Get.toNamed(ProductDetails.routeName, arguments: [
                                _productsCon.productSearchList[index].id,
                              ]);
                            },
                            child: ListTile(
                              leading: // product image
                                  CustomImg(
                                imgUrl: _productsCon
                                    .productSearchList[index].imagesInfo[0].src,
                                imgWidth: 80.w,
                                imgHeight: 80.h,
                              ),
                              title: Text(
                                _productsCon.productSearchList[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              subtitle: Text(
                                _productsCon
                                    .productSearchList[index].variants[0].sku,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                  //return Text(_productsCon.productSearchList[index].title);
                },
              ),
            ),
          );
        }
      }
    });
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    /*List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }*/
    _productsCon.getSearchAllProducts(q: query);

    return Obx(() {
      if (_productsCon.searchProductsLoading.value) {
        return Center(child: const CircularProgressIndicator());
      } else {
        if (_productsCon.productSearchList.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return SingleChildScrollView(
            child: SizedBox(
              height: 650.h,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.all(5),
                itemCount: _productsCon.productSearchList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Get.toNamed(ProductDetails.routeName, arguments: [
                                _productsCon.productSearchList[index].id,
                                "test"
                              ]);
                            },
                            child: ListTile(
                              leading: // product image
                                  CustomImg(
                                imgUrl: _productsCon
                                    .productSearchList[index].imagesInfo[0].src,
                                imgWidth: 80.w,
                                imgHeight: 80.h,
                              ),
                              title: Text(
                                _productsCon.productSearchList[index].title,
                                style: const TextStyle(fontSize: 16),
                              ),
                              subtitle: Text(
                                _productsCon
                                    .productSearchList[index].variants[0].sku,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );

                  //return Text(_productsCon.productSearchList[index].title);
                },
              ),
            ),
          );
        }
      }
    });
  }
}
