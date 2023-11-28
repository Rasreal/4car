// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:excel/excel.dart';

Future excellOutputComments(
  String averageRating,
  String numRating,
  String numReview,
  String goodReview,
  String? badReview,
  String? processedReview,
) async {
  // Add your function code here!
  var excel = Excel.createExcel();

  /*
      * sheetObject.updateCell(cell, value, { CellStyle (Optional)});
      * sheetObject created by calling - // Sheet sheetObject = excel['SheetName'];
      * cell can be identified with Cell Address or by 2D array having row and column Index;
      * Cell Style options are optional
      */

  Sheet sheetObject = excel['Комментарии'];
  sheetObject.isRTL = true;
  excel.delete('Sheet1');
  excel.delete('Лист1');
  CellStyle cellStyle = CellStyle(
      fontSize: 14, fontFamily: getFontFamily(FontFamily.Microsoft_Sans_Serif));
  CellStyle cellStyleB = CellStyle(
      fontSize: 14,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Microsoft_Sans_Serif));
  CellStyle cellStyleB2 = CellStyle(
      fontSize: 17,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Microsoft_Sans_Serif));

  CellStyle cellStyleB2Green = CellStyle(
      fontColorHex: "FF34E156",
      fontSize: 17,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Microsoft_Sans_Serif));

  CellStyle cellStyleB2Red = CellStyle(
      fontColorHex: "FFDB1616",
      fontSize: 17,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Microsoft_Sans_Serif));

  CellStyle cellStyleB2Blue = CellStyle(
      fontColorHex: "FF2196F3",
      fontSize: 17,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Microsoft_Sans_Serif));

  CellStyle cellStyleGreen = CellStyle(
      fontColorHex: "FF34E156",
      fontSize: 14,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Microsoft_Sans_Serif));

  CellStyle cellStyleRed = CellStyle(
      fontColorHex: "FFDB1616",
      fontSize: 14,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Microsoft_Sans_Serif));

  CellStyle cellStyleBlue = CellStyle(
      fontColorHex: "FF2196F3",
      fontSize: 14,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Microsoft_Sans_Serif));

  //cellStyle.underline = Underline.Single; // or Underline.Double

  ///

  /// Inserting and removing column and rows

  //sheetObject.insertRowIterables(rowList, 1, startingColumn: 2);
  var cell =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1));
  cell.value = 'Средняя оценка';
  cell.cellStyle = cellStyleB2;

  cell =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 1));
  cell.value = 'Количество оценок';
  cell.cellStyle = cellStyleB2;

  cell =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 1));
  cell.value = 'Общее количество отзывов';
  cell.cellStyle = cellStyleB2;

  cell =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 1));
  cell.value = 'Положительные отзывы';
  cell.cellStyle = cellStyleB2Green;

  cell =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 1));
  cell.value = 'Негативные отзывы';
  cell.cellStyle = cellStyleB2Red;

  cell =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 1));
  cell.value = 'Проработанные отзывы';
  cell.cellStyle = cellStyleB2Blue;
  // sheetObject.merge(
  //     CellIndex.indexByString("B2"), CellIndex.indexByString("C2"));
  // sheetObject.merge(
  //     CellIndex.indexByString("D2"), CellIndex.indexByString("E2"));
  // sheetObject.merge(
  //     CellIndex.indexByString("F2"), CellIndex.indexByString("J2"));

  var cell2 =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2));
  cell2.value = averageRating;
  cell2.cellStyle = cellStyle;

  cell2 =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 2));
  cell2.value = numRating;
  cell2.cellStyle = cellStyle;

  cell2 =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 2));
  cell2.value = numReview;
  cell2.cellStyle = cellStyle;

  cell2 =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 2));
  cell2.value = goodReview;
  cell2.cellStyle = cellStyleGreen;

  cell2 =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 2));
  cell2.value = badReview;
  cell2.cellStyle = cellStyleRed;

  cell2 =
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 2));
  cell2.value = processedReview;
  cell2.cellStyle = cellStyleBlue;

  // cell =
  //     sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 1));
  // cell.value = 'Услуги';
  // cell.cellStyle = cellStyleB2;

  // cell =
  //     sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: 1));
  // cell.value = 'Стоимость';
  // cell.cellStyle = cellStyleB2;

  // cell =
  //     sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: 1));
  // cell.value = 'Cтатус';
  // cell.cellStyle = cellStyleB2;

  // for (int i = 0; i < listViewBookingsRecordList2!.length; i++) {
  //   var listViewBookingsRecord = listViewBookingsRecordList2![i];
  //   var cell1 = sheetObject
  //       .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 3));
  //   int j = i + 1;
  //   String abcd = j.toString() + ")";
  //   cell1.value = abcd;
  //   cell1.cellStyle = cellStyle;

  //   var cell2 = sheetObject
  //       .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 3));

  //   cell2.value = '№' + listViewBookingsRecord.id.toString();
  //   cell2.cellStyle = cellStyle;

  //   var cell3 = sheetObject
  //       .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 3));
  //   String dmy = dateTimeFormat(
  //     'd/M/y',
  //     listViewBookingsRecord.bookedDate,
  //   );
  //   cell3.value = listViewBookingsRecord!.timeName! + " | " + dmy!;
  //   cell3.cellStyle = cellStyle;

  //   var cell4 = sheetObject
  //       .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 3));

  //   cell4.value = listViewBookingsRecord.boxName;
  //   cell4.cellStyle = cellStyle;
  //   var cell5 = sheetObject
  //       .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 3));
  //   String carBody = listViewBookingsRecord.carBody.toString() +
  //       ", " +
  //       listViewBookingsRecord.carName.toString();
  //   cell5.value = carBody;
  //   cell5.cellStyle = cellStyle;
  //   var cell6 = sheetObject
  //       .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: i + 3));
  //   String ab = listStringToString(
  //       listViewBookingsRecord.selectedCompanyServicesName!.toList(), 12);
  //   cell6.value = ab;
  //   cell6.cellStyle = cellStyle;
  //   var cell7 = sheetObject
  //       .cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: i + 3));
  //   String price = listViewBookingsRecord.totalPrice.toString() + " тг";
  //   cell7.value = price;

  //   cell7.cellStyle = cellStyleB;
  //   var cell8 = sheetObject
  //       .cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: i + 3));
  //   String status;
  //   if (!listViewBookingsRecord.cancelled! &&
  //       (listViewBookingsRecord.status == 'Закончено')) {
  //     status = 'Оплачен';
  //     cell8.value = status;
  //     cell8.cellStyle = cellStyleGreen;
  //   } else if (listViewBookingsRecord.cancelled! &&
  //       (listViewBookingsRecord.status == 'Отменено')) {
  //     status = 'Отменено';
  //     cell8.value = status;
  //     cell8.cellStyle = cellStyleRed;
  //   } else {
  //     status = 'Забронировано';
  //     cell8.value = status;
  //     cell8.cellStyle = cellStyle;
  //   }
  // }

  var fileBytes = excel.save(fileName: "Отчет_Комментарии.xlsx");
}
