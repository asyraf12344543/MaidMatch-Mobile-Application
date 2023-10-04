import 'package:maidapps2/database/page/listpage.dart';
import 'package:flutter/material.dart';

import 'package:maidapps2/database/models/book.dart';
import 'package:maidapps2/database/services/firebase_crud.dart';

class EditPage extends StatefulWidget {
  final Book? book;
  EditPage({this.book});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditPage();
  }
}

class _EditPage extends State<EditPage> {
  final _date = TextEditingController();
  final _time = TextEditingController();
  final _address = TextEditingController();
  final _specialrequest = TextEditingController();
  final _docid = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _docid.value = TextEditingValue(text: widget.book!.uid.toString());
    _date.value = TextEditingValue(text: widget.book!.date.toString());
    _time.value = TextEditingValue(text: widget.book!.time.toString());
    _address.value = TextEditingValue(text: widget.book!.address.toString());
    _specialrequest.value = TextEditingValue(text: widget.book!.specialrequest.toString());


  }

  @override
  Widget build(BuildContext context) {


    final DocIDField = TextField(
        controller: _docid,
        readOnly: true,
        autofocus: false,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Date",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));



    final dateField = TextFormField(
        controller: _date,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Date (MM//DD//YY)",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final timeField = TextFormField(
        controller: _time,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Time (HH:MM - HH:MM)",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final addressField = TextFormField(
        controller: _address,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Address",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final specialrequestField = TextFormField(
        controller: _specialrequest,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Special Request",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListPage(),
            ),
                (route) => false, //if you want to disable back feature set to false
          );
        },
        child: const Text('View List of Order'));

    final SaveButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.pink,
      child: MaterialButton(
        minWidth: 100,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            var response = await FirebaseCrud.updateBook(
                date: _date.text,
                time: _time.text,
                address: _address.text,
                specialrequest: _specialrequest.text,

                docId: _docid.text);
            if (response.code != 200) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(response.message.toString()),
                    );
                  });
            }
          }
        },
        child: Text(
          "Update",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('FreeCode Spot'),
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DocIDField,
                  const SizedBox(height: 25.0),
                  dateField,
                  const SizedBox(height: 25.0),
                  timeField,
                  const SizedBox(height: 35.0),
                  addressField,
                  const SizedBox(height: 35.0),
                  specialrequestField,
                  viewListbutton,
                  const SizedBox(height: 45.0),
                  SaveButon,
                  const SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}