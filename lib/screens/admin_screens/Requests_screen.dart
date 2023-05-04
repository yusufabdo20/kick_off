import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  RequestsScreen({
    super.key,
    required this.requestNumber,
    required this.username,
    // required this.userLname,
    required this.userPhone,
    required this.date,
    required this.hours,
    required this.approve,
  });
  String requestNumber;
  String username;
  // String userLname;
  String userPhone;
  String date;
  String hours;
  bool approve;

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
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
              DataColumn(label: Text('Status')),
            ],
            rows: [
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
              ),
            ],
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
}
 ) => DataRow(
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