import 'package:flutter/material.dart';
import 'package:hr_app/dashboard.dart';

class RemotePage extends StatefulWidget {
  static var tag;

  @override
  _RemotePageState createState() => _RemotePageState();
}

class _RemotePageState extends State<RemotePage> {
  TextStyle textwhiteStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  TextStyle text22bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text18bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text16bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text16 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
  );

  TextStyle text14bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text14 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
  );

  TextStyle text12 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.0,
  );

  DateTime _dateTimestar, _dateTimeend;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: SafeArea(
            top: true,
            bottom: true,
            left: true,
            right: true,
            minimum: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 32.0),
                Stack(
                  children: <Widget>[
                    Container(
<<<<<<< HEAD:lib/menu/remote_page.dart
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.keyboard_backspace,
                        color: Colors.black,
=======
                      child: FlatButton(
                        child: Icon(Icons.keyboard_backspace),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) {
                              return Dashboard();
                            }),
                          );
                        },
>>>>>>> 0b2ee1efad37b5bfab08d5c246aab70ce0e2c2e1:lib/pages/remote_page.dart
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Remote',
                        textAlign: TextAlign.center,
                        style: text16bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 32),
                Container(
                  height: 530.00,
                  width: double.maxFinite,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Pengajuan Remote',
                        style: text16bold,
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Tanggal Mulai",
                            style: text14bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                _dateTimestar == null
                                    ? ''
                                    : _dateTimestar.toString(),
                                style: text14,
                              ),
                              Container(
                                  width: 44.0,
                                  child: FlatButton(
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: _dateTimestar == null
                                                  ? DateTime.now()
                                                  : _dateTimestar,
                                              firstDate: DateTime(2015),
                                              lastDate: DateTime(2030))
                                          .then((date) {
                                        setState(() {
                                          _dateTimestar = date;
                                        });
                                      });
                                    },
                                  ))
                            ],
                          ),
                          Divider(height: 1.0, color: Colors.black)
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Tanggal Berakhir",
                            style: text14bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                _dateTimeend == null
                                    ? ''
                                    : _dateTimeend.toString(),
                                style: text14,
                              ),
                              Container(
                                  width: 44.0,
                                  child: FlatButton(
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: _dateTimeend == null
                                                  ? _dateTimestar
                                                  : _dateTimeend,
                                              firstDate: DateTime(2015),
                                              lastDate: DateTime(2030))
                                          .then((date) {
                                        setState(() {
                                          _dateTimeend = date;
                                        });
                                      });
                                    },
                                  ))
                            ],
                          ),
                          Divider(height: 1.0, color: Colors.black)
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Alasan",
                            style: text14bold,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextField(
                            maxLines: 6,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: "Alasan...",
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF707070)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF707070)),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xffFF3030),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) {
                                return Dashboard();
                              }),
                            );
                          },
                          child: Text(
                            'Ajukan Remote',
                            textAlign: TextAlign.center,
                            style: textwhiteStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.0,
                )
              ],
            )),
      ),
    );
  }
}
