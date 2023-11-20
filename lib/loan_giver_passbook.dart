import 'package:apnaloan/enrolment_center_tracker.dart';
import 'package:flutter/material.dart';
// import 'package:apnaloan/loan_giver_passbook.dart';

class LoanGiver extends StatelessWidget {
  const LoanGiver({
    required this.loanSeekers,
    required this.loanGivers,
    super.key,
  });

  final Map<String, dynamic> loanGivers;
  final Map<String, dynamic> loanSeekers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 172, 162, 189),
        foregroundColor: Colors.black,
        title: const Text('Loan Giver Passbook'),
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
                  // DataColumn(
                  //   label: Text('Transaction ID'),
                  // ),
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
                rows: List<DataRow>.generate(
                  loanGivers.length,
                  (index) {
                    String passbookKey = loanGivers.keys.elementAt(index);
                    Map<String, dynamic> giverTransactions =
                        loanGivers[passbookKey];
                    return DataRow(
                      cells: [
                        // DataCell(
                        //   Text(passbookKey),
                        // ),
                        DataCell(
                          Text(giverTransactions['date']),
                        ),
                        DataCell(
                          Text(giverTransactions['name']),
                        ),
                        DataCell(
                          Text(giverTransactions['amount'].toString()),
                        ),
                        DataCell(
                          Text(giverTransactions['type']),
                        ),

                        DataCell(
                          Text(giverTransactions['info']),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EnrolmentCenterTracker(
                loanSeekers: loanSeekers,
                loanGivers: loanGivers,
                // enrolmentCenterTracker:enrolmentCenterTracker,
              ),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward,
            color: Color.fromARGB(182, 0, 0, 0)),
      ),
    );
  }
}
