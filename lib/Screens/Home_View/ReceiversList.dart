
import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Screens/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ReceiversList extends StatefulWidget {
  const ReceiversList({Key? key}) : super(key: key);

  @override
  _ReceiversListState createState() => _ReceiversListState();
}

class _ReceiversListState extends State<ReceiversList> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xfffeceded),
        title: Image.asset(
          "assets/profile/header.png",
          height: 220,
          width: 550,
          fit: BoxFit.fitWidth,
        ).centered(),
        actions: [
          Image.asset(
            "assets/profile/search.png",
            height: 20,
            width: 20,
          ).pOnly(right: 20).onTap(() {
            Navigator.pushNamed(context, MyRoutes.RouteSearch);
          })
        ],
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          header: const Text("Receiver's List").centered(),
          rowsPerPage: _rowsPerPage,
          //availableRowsPerPage: const <int>[5, 10, 20],
          onRowsPerPageChanged: (int? value) {
            if (value != null) {
              setState(() => _rowsPerPage = value);
            }
          },
          columns: kTableColumns,
          source: DessertDataSource(),
        ),
      ).wFull(context),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
      label: Expanded(
          child: Text(
        'ID No',
        textAlign: TextAlign.center,
      )),
      numeric: true),
  DataColumn(
    label: Expanded(
        child: Text(
      'Name',
      textAlign: TextAlign.center,
    )),
    numeric: true,
  ),
  DataColumn(
    label: Expanded(
        child: Text(
      'Cell Number',
      textAlign: TextAlign.center,
    )),
    numeric: true,
  ),
  DataColumn(
    label: Expanded(
        child: Text(
      'City',
      textAlign: TextAlign.center,
    )),
    numeric: true,
  ),
  DataColumn(
    label: Expanded(
        child: Text(
      'Blood Group',
      textAlign: TextAlign.center,
    )),
    numeric: true,
  ),
  DataColumn(
      label: Expanded(
          child: Text(
        'Date',
        textAlign: TextAlign.center,
      )),
      numeric: true),
];

////// Data class.
class Dessert {
  final int userID;
  final String name;
  final int phone;
  final String city;
  final String blood;
  final String date;

  Dessert(this.userID, this.name, this.phone, this.city, this.blood, this.date);
  //bool selected = false;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  static final DateTime now = DateTime.now();
  int _selectedCount = 0;
  final List<Dessert> _desserts = <Dessert>[
    Dessert(1, "Anas Mughal", 03023759375, "Khanpur", "A+", now.toString()),
  ];
  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(index: index,
        //selected: dessert.selected,
        // onSelectChanged: (bool? value) {
        //   if (value == null) return;
        //   if (dessert.selected != value) {
        //     _selectedCount += value ? 1 : -1;
        //     assert(_selectedCount >= 0);
        //     dessert.selected = value;
        //      notifyListeners();
        //   }
        // },
        cells: <DataCell>[
          DataCell(Center(
            child: Text(
              dessert.userID.toString(),
              textAlign: TextAlign.center,
            ),
          )),
          DataCell(Center(
            child: Text(
              dessert.name,
              textAlign: TextAlign.center,
            ),
          )),
          DataCell(Center(
              child: Text(
            dessert.phone.toString(),
            textAlign: TextAlign.center,
          ))),
          DataCell(Center(
              child: Text(
            dessert.city,
            textAlign: TextAlign.center,
          ))),
          DataCell(Center(
            child: Text(
              dessert.blood,
              textAlign: TextAlign.center,
            ),
          )),
          DataCell(Center(
            child: Text(
              dessert.date,
              textAlign: TextAlign.center,
            ),
          )),
        ]);
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
