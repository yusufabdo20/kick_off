import 'package:flutter/material.dart';
import 'package:kick_off/models/OwnerModels/requestReportModel.dart';
import 'package:kick_off/state_management/ownerProviders/ownerProvidser.dart';
import 'package:provider/provider.dart';

class CallReportScreen extends StatefulWidget {
  CallReportScreen();

  @override
  State<CallReportScreen> createState() => _CallReportScreenState();
}

class _CallReportScreenState extends State<CallReportScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OwnerProvider>().get_callsReport();
  }

  @override
  Widget build(BuildContext context) {
    List<CallsReportModel> callsReport =
        Provider.of<OwnerProvider>(context).callsReport;

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
          "Calls",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/back4.png"),
            fit: BoxFit.cover,
          )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Call\nNumber '),
                  ),
                  DataColumn(label: Text('User\nName')),
                  DataColumn(label: Text('User\nPhone')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Field Name')),
                ],
                rows: callsReport.map((data) {
                  return DataRow(cells: [
                    DataCell(Text('${data.id}')),
                    DataCell(Text('${data.user!.name}')),
                    DataCell(Text('${data.user!.phone}')),
                    DataCell(Text('${data.club!.creationDate}')),
                    DataCell(Text('${data.club!.name}')),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
