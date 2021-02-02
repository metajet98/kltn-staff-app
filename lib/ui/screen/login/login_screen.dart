import 'package:staff_maintenance_app/generated/assets.gen.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/login/login_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends BaseView<LoginScreenModel> {
  final _phoneInputController = TextEditingController();
  final _passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Container(
            height: Get.height * 5 / 6,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 48),
                  child: Material(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white,
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Tài khoản nhân viên",
                            style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 32),
                          TextField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneInputController,
                            decoration: InputDecoration(
                                labelText: "Số điện thoại",
                                border: new OutlineInputBorder(
                                  gapPadding: 0,
                                  borderRadius: const BorderRadius.all(const Radius.circular(20)),
                                ),
                                hintText: "Nhập số điện thoại",
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 14)),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            controller: _passwordInputController,
                            decoration: InputDecoration(
                              labelText: "Mật khẩu",
                              hintText: "Nhập mật khẩu",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                              border: new OutlineInputBorder(
                                gapPadding: 0,
                                borderRadius: const BorderRadius.all(const Radius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () =>
                                    viewModel.onLogin(_phoneInputController.text, _passwordInputController.text),
                                child: Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      "Đăng nhập",
                                      style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
                                    )),
                                color: Colors.green,
                              ),
                              SizedBox(width: 16),
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Quên mật khẩu",
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                color: Colors.transparent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Material(
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                    color: Colors.white,
                    child: ClipRRect(
                      child: Container(
                        width: 96,
                        height: 96,
                        child: Hero(
                          tag: "ic_logo",
                          child: Assets.resources.images.icLogo.image(fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
