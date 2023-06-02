import 'package:flutter/material.dart';
import 'package:kick_off/models/OwnerModels/requestReportModel.dart';
import 'package:kick_off/state_management/ownerProviders/ownerProvidser.dart';
import 'package:provider/provider.dart';

class ViewsReportScreen extends StatefulWidget {
  ViewsReportScreen();

  @override
  State<ViewsReportScreen> createState() => _ViewsReportScreenState();
}

class _ViewsReportScreenState extends State<ViewsReportScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OwnerProvider>().get_viewsReport();
  }

  @override
  Widget build(BuildContext context) {
    List<ViewsReportModel> viewsReport =
        Provider.of<OwnerProvider>(context).viewsReport;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Views",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(
                  label: Text('View\nNumber '),
                ),
                DataColumn(label: Text('User\nName')),
                DataColumn(label: Text('User\nPhone')),
                // DataColumn(label: Text('Date')),
                DataColumn(label: Text('Field Name')),
              ],
              rows: viewsReport
                  .map((data) {
                return DataRow(cells: [
                  DataCell(Text('${data.id}')),
                  DataCell(Text('${data.user!.name}')),
                  DataCell(Text('${data.user!.phone}')),
                  DataCell(Text('${data.user!.email}')),
                ]);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
