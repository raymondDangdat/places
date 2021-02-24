import 'package:flutter/material.dart';
import 'package:places/screens/map_screen.dart';
import '../providers/places_provider.dart';
import 'package:provider/provider.dart';

class PlaceDetailsScreen extends StatelessWidget {
  static const routeName = '/place-detail';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<PlacesProvider>(context, listen: false).findPlaceById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 250.0,
            width: double.infinity,
            child: Image.file(
              selectedPlace.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            selectedPlace.location.address,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, color: Colors.grey),
          ),
          SizedBox(
            height: 10.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                        initialLocation: selectedPlace.location,
                        isSelecting: false,
                      )));
            },
            child: Text('View on Map'),
            textColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
