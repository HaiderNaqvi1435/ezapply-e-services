
// Widget acdemicRecord({required BuildContext context}) {
//   final columns = [
//     "Examination",
//     "Board/University",
//     "Passing Year",
//     "Roll no",
//     "Reg no",
//     "Marks Obtained",
//     "Total Marks",
//     "Subject Obtained",
//     "Subject Total",
//     "Grade/Division",
//     "Major Subjects"
//   ];
//   return DataTable(
//       // sortColumnIndex: sortedcolumnIndex,
//       columns: getColumns(columns),
//       rows: getRows(prodlist, context));
// }

// List<DataColumn> getColumns(List<String> columns) =>
//     columns.map((String column) => DataColumn(label: Text(column))).toList();

// List<DataRow> getRows(List prodlist, BuildContext context) =>
//     prodlist.map((soldProducts) {
//       final cells = [
//         soldProducts.productID,
//         soldProducts.customername,
//         soldProducts.datetime,
//         soldProducts.totalbill,
//       ];
//       return DataRow(cells: getCells(cells));
//     }).toList();

// List<DataCell> getCells(List<dynamic> cells) => cells.map((celldata) {
//       return DataCell(Text("$celldata"));
//     }).toList();
