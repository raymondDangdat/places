import 'package:flutter/material.dart';

class LocationInPut extends StatefulWidget {
  @override
  _LocationInPutState createState() => _LocationInPutState();
}

class _LocationInPutState extends State<LocationInPut> {
  String _previewImageUrl;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170.0,
          alignment: Alignment.center,
          width: double.infinity,
          child: _previewImageUrl == null
              ? Text(
                  'No Location Chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          children: [
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
