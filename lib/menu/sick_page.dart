import 'package:flutter/material.dart';
import 'package:hr_app/dashboard/dashboard.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SickPage extends StatefulWidget {
  @override
  _SickPageState createState() => _SickPageState();
}

class _SickPageState extends State<SickPage> {
  File image;
  Future getImage() async {
    File picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = picture;
    });
  }

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

  final dateFormat = DateFormat('EEE, dd MMMM yyyy');

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
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Sakit',
                        textAlign: TextAlign.center,
                        style: text16bold,
                      ),
                    ),
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
                        'Pengajuan Sakit',
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
                                    : dateFormat.format(_dateTimestar),
                                style: text14,
                              ),
                              Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.calendar_today,
                                      size: 27.0,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
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
                                    : dateFormat.format(_dateTimeend),
                                style: text14,
                              ),
                              Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.calendar_today,
                                      size: 27.0,
                                      color: Colors.black,
                                    ),
                                    onTap: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: _dateTimeend == null
                                                  ? _dateTimestar
                                                  : _dateTimeend,
                                              firstDate: DateTime(2020),
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
                            "Upload Surat Dokter",
                            style: text14bold,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Container(
                              height: 125.00,
                              width: double.maxFinite,
                              //padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(13.00),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                      height: double.maxFinite,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(13.00),
                                      ),
                                      child: image == null
                                          ? Text('')
                                          : Image.file(
                                              image,
                                              fit: BoxFit.cover,
                                            )),
                                  Center(
                                    child: FlatButton(
                                        onPressed: getImage,
                                        child: Image.asset(
                                          'assets/images/upload.png',
                                          height: 50.0,
                                        )),
                                  ),
                                ],
                              ))
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
                            Alert(
                              context: context,
                              type: AlertType.success,
                              title: "Pengajuan Sedang Ditinjau",
                              buttons: [
                                DialogButton(
                                    child: Text("Lanjutkan",
                                        style: text18bold.copyWith(
                                            color: Colors.white)),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (_) {
                                          return Dashboard();
                                        }),
                                      );
                                    }),
                              ],
                            ).show();
                          },
                          child: Text(
                            'Ajukan Izin Sakit',
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
