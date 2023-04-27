import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

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
          columns: [       
            DataColumn(label: Column(
              children: [
                Text('Request \n Number '),
                
              ],
            ),
            ),
            DataColumn(label: Column(
              children: [
                Text('User'),
                Text('Name'),
              ],
            )),
            DataColumn(label: Column(
              children: [
                Text('User'),
                Text('Phone'),
              ],
            )),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Status')),
          ],
          rows: [
           DataRow(cells: [
              DataCell(Text("1")),
              DataCell(Column(
                children: [
                  Text("yyyyyy"),
                  Text("hhhhhhh"),
                ],
              ),
              ),
              DataCell(Text("000000000")),
              DataCell(Column(
                children: [
                  SizedBox(height: 10,),
                  Text("333333"),
                  Text("333333"),
                ],
              ),
              ),
              DataCell( Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.check_circle , color: Colors.green,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.cancel , color: Colors.red,)),
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
// approve==true? Text("Approved") : Text("Canceled")