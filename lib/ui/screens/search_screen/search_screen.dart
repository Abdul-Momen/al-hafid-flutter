import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/ui/screens/product_details_page/product_details.dart';
import 'package:alhafidh/ui/widgets/custom_app_bar.dart';
import 'package:alhafidh/ui/widgets/custom_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = '/search';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ProductsController _productsCon = Get.find<ProductsController>();
  final TextEditingController searchCon = TextEditingController();

  @override
  void initState() {
    searchCon.text = Get.arguments[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            addH(16.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: ConstantColors.lightGray)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: 180.w,
                        child: TextField(
                          controller: searchCon,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: ConstantStrings.kAppRobotoFont,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: AppLocalizations.of(context)!.search_txt,
                          ),
                          onChanged: (value) {
                           /* if (value == '') {
                              setState(() {
                              ///\  _productsCon.searchProductList.clear();
                                Get.back();
                              });
                            } else {
                              _productsCon.getSearchProduct(value);
                            }*/
                          },

                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)),
                        color: Colors.black,
                      ),
                      height: 46.h,
                      width: 53.h,
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
/*
            Obx(() {
              if (_productsCon.searchLoading.value) {
                return const CircularProgressIndicator();
              } else {
                if (_productsCon.searchProductList.isEmpty) {
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
                        itemCount: _productsCon.searchProductList.length,
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
                                      Get.toNamed(ProductDetails.routeName,
                                          arguments: [
                                            int.parse(
                                              _productsCon
                                                  .searchProductList[index]
                                                  .node
                                                  .id
                                                  .replaceAll(
                                                      new RegExp(r'[^0-9]'),
                                                      ''),
                                            )
                                          ]);
                                    },
                                    child: ListTile(
                                      leading: // product image
                                          CustomImg(
                                        imgUrl: _productsCon
                                            .searchProductList[index]
                                            .node
                                            .images
                                            .edges[0]
                                            .node
                                            .originalSrc,
                                        imgWidth: 80.w,
                                        imgHeight: 80.h,
                                      ),
                                      title: Text(
                                        _productsCon.searchProductList[index]
                                            .node.title,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      subtitle: Text(
                                        _productsCon.searchProductList[index]
                                            .node.variants.edges[0].node.sku,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              }
            }),
*/
          ],
        ),
      ),
    );
  }
}
