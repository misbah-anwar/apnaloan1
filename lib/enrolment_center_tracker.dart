import 'package:flutter/material.dart';

class EnrolmentCenterTracker extends StatelessWidget {
  final Map<String, dynamic> loanSeekers;
  final Map<String, dynamic> loanGivers;

  const EnrolmentCenterTracker({
    required this.loanSeekers,
    required this.loanGivers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DataRow> enrolmentRows = [];

    List<Map<String, dynamic>> combinedList = [];
    combinedList.addAll(loanSeekers.values.cast<Map<String, dynamic>>());
    combinedList.addAll(loanGivers.values.cast<Map<String, dynamic>>());

    combinedList.sort((a, b) {
      DateTime dateA = _parseDate(a['date']);
      DateTime dateB = _parseDate(b['date']);
      return dateA.compareTo(dateB);
    });

    for (var entry in combinedList) {
      enrolmentRows.add(
        DataRow(
          cells: [
            DataCell(
              Text(entry['date']),
            ),
            DataCell(
              Text(entry['name']),
            ),
            DataCell(
              Text(entry['amount'].toString()),
            ),
            DataCell(
              Text(entry['type']),
            ),
            DataCell(
              Text(entry['info']),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 172, 162, 189),
        foregroundColor: Colors.black,
        title: const Text('Enrolment Center'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 190, 171, 223),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text('Date'),
                  ),
                  DataColumn(
                    label: Text('Name'),
                  ),
                  DataColumn(
                    label: Text('Amount'),
                  ),
                  DataColumn(
                    label: Text('Type'),
                  ),
                  DataColumn(
                    label: Text('Info'),
                  ),
                ],
                rows: enrolmentRows,
              ),
            ),
          ),
        ),
      ),
    );
  }

  DateTime _parseDate(String dateString) {
    List<String> parts = dateString.split('-');
    int day = int.parse(parts[0]);
    String month = parts[1];
    int year = int.parse(parts[2]);
    return DateTime(year, _getMonthNumber(month), day);
  }

  int _getMonthNumber(String month) {
    switch (month) {
      case 'Jan':
        return 1;
      case 'Feb':
        return 2;
      case 'Mar':
        return 3;
      case 'Apr':
        return 4;
      case 'May':
        return 5;
      case 'Jun':
        return 6;
      case 'Jul':
        return 7;
      case 'Aug':
        return 8;
      case 'Sep':
        return 9;
      case 'Oct':
        return 10;
      case 'Nov':
        return 11;
      case 'Dec':
        return 12;
      default:
        return 1;
    }
  }
}
