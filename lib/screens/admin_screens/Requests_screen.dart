import 'package:flutter/material.dart';
import 'package:kick_off/models/OwnerModels/requestReportModel.dart';
import 'package:kick_off/state_management/ownerProviders/ownerProvidser.dart';
import 'package:provider/provider.dart';

class RequestsScreen extends StatefulWidget {
  RequestsScreen(
      // {
      // super.key,
      // required this.requestNumber,
      // required this.username,
      // // required this.userLname,
      // required this.userPhone,
      // required this.date,
      // required this.hours,
      // required this.approve,
      // }
      );

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  // String requestNumber;
  @override
  void initState() {
    super.initState();
    context.read<OwnerProvider>().get_requestReport();
  }

  @override
  Widget build(BuildContext context) {
    List<RequestReportModel> requestsReport =
        Provider.of<OwnerProvider>(context).requestsReport;

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
          "Requests",
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
                  label: Text('Request\nNumber '),
                ),
                DataColumn(label: Text('User\nName')),
                DataColumn(label: Text('User\nPhone')),
                DataColumn(label: Text('Date')),
                // DataColumn(label: Text('Status')),
              ],
              rows: requestsReport.map((data) {
                return DataRow(cells: [
                  DataCell(Text('${data.id}')),
                  DataCell(Text('${data.user!.name}')),
                  DataCell(Text('${data.user!.phone}')),
                  DataCell(Text('${data.bookDate}')),
                ]);
              }).toList(),
              // [
              //   DataRow(
              //     cells: [
              //       DataCell(Text('${requestsReport[0].id}')),
              //       DataCell(Text('${requestsReport[0].user!.name}')),
              //       DataCell(Text('${requestsReport[0].user!.phone}')),
              //       DataCell(Text('${requestsReport[0].bookDate}')),
              //       // DataCell(
              //       //   Row(
              //       //     children: [
              //       //       IconButton(
              //       //           onPressed: () {},
              //       //           icon: Icon(
              //       //             Icons.check_circle,
              //       //             color: Colors.green,
              //       //           )),
              //       //       IconButton(
              //       //           onPressed: () {},
              //       //           icon: Icon(
              //       //             Icons.cancel,
              //       //             color: Colors.red,
              //       //           )),
              //       //     ],
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ],
            ),
          ),
        ),
      ),
    );
  }
}

List<DataRow> requests = [];
buildDataRow({
  required String requestNumber,
  required String username,
  // String userLname;
  required String userPhone,
  required String date,
  required String hours,
  bool approve = false,
}) =>
    DataRow(
      cells: [
        DataCell(Text(requestNumber)),
        DataCell(Text(username)),
        DataCell(Text(userPhone)),
        DataCell(Text(date)),
        DataCell(
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ],
    ); 

// approve==true? Text("Approved") : Text("Canceled")