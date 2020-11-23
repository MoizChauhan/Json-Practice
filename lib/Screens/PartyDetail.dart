import 'package:SaturnCube/Model/party.dart';
import 'package:flutter/material.dart';

class PartyDetail extends StatelessWidget {
  final Party party;

  const PartyDetail({this.party});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            party.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
            child: ListView(
          children: [
            textView('Id: ${party.id}'),
            textView('UserName: ${party.username}'),
            textView('Email: ${party.email}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ExpansionTile(
                  backgroundColor: Colors.white,
                  trailing: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  expandedAlignment: Alignment.centerLeft,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.symmetric(horizontal: 8),
                  title: Text(
                    'Address',
                    style: TextStyle(fontSize: 20),
                  ),
                  children: [
                    Text(
                      'Street: ${party.address.street}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Suite: ${party.address.suite}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'City: ${party.address.city}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'ZipCode: ${party.address.zipcode}',
                      style: TextStyle(fontSize: 20),
                    ),
                    ExpansionTile(
                      trailing: Icon(
                        Icons.arrow_downward,
                      ),
                      tilePadding: EdgeInsets.symmetric(horizontal: 5),
                      expandedAlignment: Alignment.centerLeft,
                      title: Text(
                        'Geolocation',
                        style: TextStyle(fontSize: 20),
                      ),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding: EdgeInsets.symmetric(horizontal: 4),
                      children: [
                        Text(
                          'Latitude: ${party.address.geo.lat}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Longitude: ${party.address.geo.lng}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            textView('Phone Number: ${party.phone}'),
            textView('Website: ${party.website}'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ExpansionTile(
                  expandedAlignment: Alignment.centerLeft,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: EdgeInsets.symmetric(horizontal: 8),
                  trailing: Icon(
                    Icons.arrow_downward,
                  ),
                  title: Text(
                    'Company Detail',
                    style: TextStyle(fontSize: 20),
                  ),
                  children: [
                    Text(
                      'Name: ${party.company.name}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Catch Phrase: ${party.company.catchPhrase}',
                      softWrap: true,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'BS: ${party.company.bs}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }

  Widget textView(text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
