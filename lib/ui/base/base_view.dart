import 'package:flutter/material.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/ui/base/base_view_model.dart';

abstract class BaseView<T extends BaseViewModel> extends StatefulWidget {

  BaseView({Key key}) : super(key: key);

  final T viewModel = locator<T>();

  void onInit() {
    viewModel.onInit();
  }

  void onDispose() {
    viewModel.onDispose();
  }

  Widget build(BuildContext context);

  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void initState() {
    widget.viewModel.view = widget;
    widget.onInit();
    super.initState();
  }

  @override
  void dispose() {
    widget.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}
