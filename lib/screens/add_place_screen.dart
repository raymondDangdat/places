import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/image_input.dart';
import '../providers/places_provider.dart';
import '../widgets/location_input.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      Fluttertoast.showToast(msg: "Please add a valid title of the place");
      return;
    }
    Provider.of<PlacesProvider>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Fluttertoast.showToast(msg: "Place Added");

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a New Place"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ImageInput(_selectImage),
                    SizedBox(
                      height: 10.0,
                    ),
                    LocationInPut(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: (8.0)),
            child: RaisedButton.icon(
                onPressed: _savePlace,
                elevation: 0.0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                color: Theme.of(context).accentColor,
                splashColor: Theme.of(context).primaryColor,
                label: Text(
                  'Add Place',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
