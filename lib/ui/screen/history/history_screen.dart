import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:staff_maintenance_app/ui/base/base_view.dart';
import 'package:staff_maintenance_app/ui/screen/history/history_screen_model.dart';
import 'package:staff_maintenance_app/ui/screen/maintenance/user_vehicle_info/views/maintenance_history_item_view.dart';
import 'package:staff_maintenance_app/ui/shared/list_view/easy_listview.dart';

class HistoryScreen extends BaseView<HistoryScreenModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => viewModel.loadHistory(showLoading: false),
          child: EasyListView(
            padding: EdgeInsets.all(16),
            dividerBuilder: (ctx, index) => SizedBox(height: 16),
            itemCount: viewModel.histories?.length ?? 0,
            itemBuilder: (ctx, index) => MaintenanceHistoryItemView(maintenance: viewModel.histories[index], isHistory: true),
          ),
        ),
      ),
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
