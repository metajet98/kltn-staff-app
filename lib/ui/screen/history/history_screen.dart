import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/history/history_screen_model.dart';

class HistoryScreen extends BaseView<HistoryScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }

  @override
  BaseViewState<HistoryScreenModel> createState() => HistoryScreenState();
}

class HistoryScreenState extends BaseViewState<HistoryScreenModel> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.build(context);
  }

  @override
  bool get wantKeepAlive => true;
}