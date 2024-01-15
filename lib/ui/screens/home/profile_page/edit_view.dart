import 'package:alhafidh/constants/string.dart';
import 'package:alhafidh/states/controller/auth.dart';
import 'package:alhafidh/states/data/prefs.dart';
import 'package:alhafidh/states/models/customer_model.dart';
import 'package:alhafidh/states/utils/methods.dart';
import 'package:alhafidh/ui/screens/home/home.dart';
import 'package:alhafidh/ui/widgets/custom_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/helper.dart';
import 'edit_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditView extends StatefulWidget {
  final CustomerModel? userModel;

  const EditView({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final AuthController _authCon = Get.put(AuthController());

  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _mobileNoCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _shopNameCon = TextEditingController();

  @override
  void initState() {
    _fNameCon.text = widget.userModel!.customer.firstName;
    _lNameCon.text = widget.userModel!.customer.lastName;
    _emailCon.text = widget.userModel!.customer.email;
    _mobileNoCon.text = widget.userModel!.customer.phone;
    // _passwordCon.text = widget.userModel.password;
    // _shopNameCon.text = widget.userModel.;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addH(25.h),
        Text(
          AppLocalizations.of(context)!.public_info,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            fontFamily: ConstantStrings.kAppRobotoFont,
          ),
        ),
        addH(25.h),
        EditItem(
            editingCon: _fNameCon,
            title: AppLocalizations.of(context)!.first_name),
        EditItem(
            editingCon: _lNameCon,
            title: AppLocalizations.of(context)!.last_name),
        EditItem(
            editingCon: _emailCon, title: AppLocalizations.of(context)!.email),
        //if(widget.userModel!.customer.phone.isNotEmpty)
        EditItem(
          editingCon: _mobileNoCon,
          title: AppLocalizations.of(context)!.mobile_num,
          inputType: TextInputType.phone,
        ),

        Center(
          child: CustomBtn(
            onPressedFn: () async {
              if (_fNameCon.text.isEmpty ||
                  _lNameCon.text.isEmpty ||
                  // _mobileNoCon.text.isEmpty ||
                  _emailCon.text.isEmpty) {
                Methods.showSnackbar(
                  msg: ConstantStrings.kEmptyFields,
                );
                return;
              }
              if (!_emailCon.text.isEmail) {
                Methods.showSnackbar(msg: ConstantStrings.kValidEmail);
                return;
              }

              //pass data
              bool upload = await _authCon.updateCustomer(
                fName: _fNameCon.text,
                lName: _lNameCon.text,
                phoneNum: _mobileNoCon.text,
                email: _emailCon.text,
              );

              Get.defaultDialog(
                title: AppLocalizations.of(context)!.wait,
                content: const CircularProgressIndicator(),
              );

              if (upload) {
                _authCon.customer(customerToken: Preference.getCToken());
                setState(() {});
                Methods.showSnackbar(
                  icon: Icons.check,
                  iconClr: Colors.green,
                  title: AppLocalizations.of(context)!.updated,
                  msg: "",
                );
                Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    Methods.hideLoading();
                    Get.offAllNamed(
                      HomeScreen.routeName,
                      arguments: [
                        '2',
                      ],
                    );
                  },
                );
              } else {
                Methods.showSnackbar(
                  msg: _authCon.resMgs,
                );
                return;
              }
            },
            btnTxt: AppLocalizations.of(context)!.update,
            txtSize: 15.sp,
            btnSize: Size(double.infinity, 50.h),
          ),
        )
      ],
    );
  }
}
