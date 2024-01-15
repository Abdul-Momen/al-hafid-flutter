import 'package:alhafidh/constants/color.dart';
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/controller/products.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/product_details_model.dart';
import 'package:alhafidh/ui/widgets/custom_img.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductGallery extends StatefulWidget {
  final ProductsController productsCon ;

  final ProductDetailsModel pModel;

  const ProductGallery({
    Key? key,
    required this.pModel, required this.productsCon,
  }) : super(key: key);

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.productsCon.pImageIndx.value = '';
    widget.productsCon.pImageIndx.value = widget.pModel.product.image.src;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addH(20.h),
        // product image
        CustomImg(
          imgUrl: widget.pModel.product.images[_selectedIndex].src,
          imgWidth: 250.w,
          imgHeight: 200.h,
        ),
        addH(5.h),
        //product stock/unStock
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.pModel.product.variants[0].inventoryQuantity != 0
                    ? AppLocalizations.of(context)!.in_stock
                    : AppLocalizations.of(context)!.sold_Out,
                style: TextStyle(
                    color:
                        widget.pModel.product.variants[0].inventoryQuantity != 0
                            ? Colors.green
                            : Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.check_circle,
                color: widget.pModel.product.variants[0].inventoryQuantity != 0
                    ? Colors.green
                    : Colors.redAccent,
                size: 15,
              ),
              addW(10.w),
            ],
          ),
        ),
        // gallery
        Container(
          width: double.infinity,
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // left arrow
              InkWell(
                onTap: () => setState(() {
                  if (_selectedIndex != 0) {
                    _selectedIndex--;
                    widget.productsCon.pImageIndx.value =
                        widget.pModel.product.images[_selectedIndex].src;
                  }
                }),
                child: SizedBox(
                  height: 15.h,
                  width: 15.w,
                  child: Preference.getIsArabicFlag()
                      ? SvgPicture.asset(
                          'assets/svg/arrow_right.svg',
                        )
                      : SvgPicture.asset(
                          'assets/svg/arrow_left.svg',
                        ),
                ),
              ),
              // image list
              SizedBox(
                width: 300.w,
                child: Center(
                  child: ListView.builder(
                    itemCount: widget.pModel.product.images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => setState(() {
                          _selectedIndex = index;
                          widget.productsCon.pImageIndx.value = widget.pModel.product.images[index].src;
                        }),
                        child: Container(
                          width: 80.w,
                          height: 70.h,
                          margin:
                              index == widget.pModel.product.images.length - 0
                                  ? null
                                  : EdgeInsets.only(right: 10.w),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ConstantColors.lightRed,
                              width: _selectedIndex == index ? 3 : 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CustomImg(
                              imgWidth: 50.w,
                              imgHeight: 50.h,
                              imgUrl: widget.pModel.product.images[index].src,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // right arrow
              InkWell(
                onTap: () => setState(() {
                  if (_selectedIndex !=
                      widget.pModel.product.images.length - 1) {
                    _selectedIndex++;
                    widget.productsCon.pImageIndx.value =
                        widget.pModel.product.images[_selectedIndex].src;
                  }
                }),
                child: SizedBox(
                  width: 15.w,
                  height: 15.h,
                  child: Preference.getIsArabicFlag()
                      ? SvgPicture.asset(
                          'assets/svg/arrow_left.svg',
                        )
                      : SvgPicture.asset(
                          'assets/svg/arrow_right.svg',
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
