import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:staff_maintenance_app/helpers/format_helper.dart';
import 'package:staff_maintenance_app/models/maintenance/bill_detail.dart';

class BillTableView extends StatelessWidget {
  final List<BillDetail> billDetails;

  const BillTableView({Key key, this.billDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TableRow> tableRows = List.from([
      TableRow(children: _buildHeader())
    ]);
    tableRows.addAll(billDetails?.map((e) => TableRow(children: _buildRow(e)))?.toList() ?? []);
    return Table(
      children: tableRows,
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
    );
  }

  List<Widget> _buildHeader() {
    return [
      Text("Tên phụ tùng và công việc", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      Text("Số lượng", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      Text("Đơn giá", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      Text("Tiền công", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      Text("Tổng giá", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
    ];
  }

  List<Widget> _buildRow(BillDetail billDetail) {
    return [
      Text(billDetail.title, textAlign: TextAlign.center,),
      Text(billDetail.quantity?.toString() ?? "0", textAlign: TextAlign.center,),
      Text(FormatHelper.formatMoney(billDetail.sparePartPrice), textAlign: TextAlign.center,),
      Text(FormatHelper.formatMoney(billDetail.laborCost), textAlign: TextAlign.center,),
      Text(FormatHelper.formatMoney(billDetail.totalPrice), textAlign: TextAlign.center,),
    ];
  }
}
