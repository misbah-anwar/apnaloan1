import 'package:apnaloan/loan_giver_passbook.dart';
import 'package:flutter/material.dart';

class LoanSeeker extends StatelessWidget {
  const LoanSeeker({
    required this.loanSeekers,
    required this.loanGivers,
    super.key,
  });

  final Map<String, dynamic> loanSeekers;
  final Map<String, dynamic> loanGivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 172, 162, 189),
        foregroundColor: Colors.black,
        title: const Text('Loan Seeker Passbook'),
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
                  loanSeekers.length,
                  (index) {
                    String passbookKey = loanSeekers.keys.elementAt(index);
                    Map<String, dynamic> seekerTransactions =
                        loanSeekers[passbookKey];
                    return DataRow(
                      cells: [
                        // DataCell(
                        //   Text(passbookKey),
                        // ),
                        DataCell(
                          Text(seekerTransactions['date']),
                        ),
                        DataCell(
                          Text(seekerTransactions['name']),
                        ),
                        DataCell(
                          Text(seekerTransactions['amount'].toString()),
                        ),
                        DataCell(
                          Text(seekerTransactions['type']),
                        ),

                        DataCell(
                          Text(seekerTransactions['info']),
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
              builder: (context) => LoanGiver(
                loanSeekers: loanSeekers, loanGivers: loanGivers,
                // loanGivers:loanGivers,
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
