import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import './../screens/report_a_boar.dart';
import './../screens/article_screen.dart';

class KnowledgeBase extends StatefulWidget {
  @override
  _KnowledgeBaseState createState() => _KnowledgeBaseState();
}

class _KnowledgeBaseState extends State<KnowledgeBase> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 3, color: Colors.redAccent);
          },
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: double.maxFinite,
              padding: EdgeInsets.fromLTRB(12, 4, 12, 12),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: RaisedButton(
                        color: Colors.grey.shade400,
                        child: const Text('Zgłoś dzika'),
                        onPressed: () => {
                              Navigator.of(context)
                                  .pushNamed(ReportABoar.routeName)
                            }),
                  ),
                  Card(
                    elevation: 2,
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                'assets/1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: const Text('Spotkałem dzika, co teraz?',
                                style: TextStyle(fontSize: 16)),
                            subtitle: Text(
                              'ważne kroki bezpieczeństwa',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Na dziki natykamy się co raz częściej w trakcie spacerów z psem, zbierania grzybów w lesie czy podróży.',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Article(
                                        'assets/1.png',
                                        'Spotkałem dzika, co teraz?',
                                        'ważne kroki bezpieczeństwa',
                                        'assets/article-1.txt'),
                                  ),
                                );
                              },
                              child: const Text('DOWIEDZ SIĘ WIĘCEJ'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 2,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                'assets/2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: const Text('O czym pamiętać jadąc do lasu?'),
                            subtitle: Text(
                              'niby oczywiste, ale czy zawsze',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Schodząc z utartych ścieżek możemy natknąć się na zainfekowane szczątki i nawet tego nie zauważyć.',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Article(
                                        'assets/3.png',
                                        'O czym pamiętać jadąc do lasu?',
                                        'niby oczywiste, ale czy zawsze',
                                        'assets/article-2.txt'),
                                  ),
                                );
                              },
                              child: const Text('DOWIEDZ SIĘ WIĘCEJ'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 3,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                'assets/2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: const Text('ASF w liczbach'),
                            subtitle: Text(
                              'zbiór ciekawostek',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Garść faktów które pomogą wyjaśnić dlaczego tak trudno zwalczyć wirusa',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Article(
                                        'assets/3.png',
                                        'ASF w liczbach',
                                        'zbiór ciekawostek',
                                        'assets/article-3.txt'),
                                  ),
                                );
                              },
                              child: const Text('DOWIEDZ SIĘ WIĘCEJ'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              'assets/2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: const Text('Jak rozprzestrzenia się ASF?'),
                          subtitle: Text(
                            'powszechne drogi zakażenia',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'ASF jest zabójczy dla trzody chlewnej. Zobacz na co zwrócić uwagę, by ograniczyć rozprzestrzenianie wirusa.',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 16),
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Article(
                                        'assets/3.png',
                                        'Jak rozprzestrzenia się ASF?',
                                        'powszechne drogi zakażenia',
                                        'assets/article-2.txt'),
                                  ),
                                );
                              },
                              child: const Text('DOWIEDZ SIĘ WIĘCEJ'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
