
import 'package:alhafidh/helper/helper.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/ui/screens/home/profile_page/row_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GeneralView extends StatelessWidget {
  final CustomerModel uModel;
  const GeneralView({
    Key? key,
    required this.uModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addH(60.h),
        // user information
        RowItem(
          prefixTxt:  AppLocalizations.of(context)!.full_name,
           suffixTxt: uModel.customer.firstName+" "+ uModel.customer.lastName,

        ),
        RowItem(
          prefixTxt: AppLocalizations.of(context)!.email,
           suffixTxt: uModel.customer.email,
        ),
        if(uModel.customer.phone.isNotEmpty)
        RowItem(
          prefixTxt: AppLocalizations.of(context)!.mobile_num,
           suffixTxt: uModel.customer.phone,
        ),
        RowItem(
          prefixTxt: AppLocalizations.of(context)!.password,
          // suffixTxt: uModel.password,
          suffixTxt: '******',
        ),
       /* const RowItem(
          prefixTxt: 'Shop Name',
          suffixTxt: 'Not Found!',
        ),*/
      ],
    );
  }
}