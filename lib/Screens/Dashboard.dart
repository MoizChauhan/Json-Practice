import 'package:SaturnCube/Model/party.dart';
import 'package:SaturnCube/Screens/PartyDetail.dart';
import 'package:SaturnCube/utils/getdata.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  final String email;

  const DashBoard({this.email});
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool found = false;
  List<Party> partyList;
  Future<void> getItem() async {
    PartyList instance = PartyList();
    instance.getList().then((value) {
      if (instance.isdataFound) {
        setState(() {
          found = true;
          partyList = instance.partyList;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Party Details'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: Text(
                    widget.email,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
              ),
              ListTile(
                title: Text('Party List'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Setting'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('About Us'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Help'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: found
              ? ListView.separated(
                  itemCount: partyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PartyDetail(
                                  party: partyList[index],
                                ),
                              ));
                        },
                        child: Card(
                          child: ListTile(
                            leading: Text(partyList[index].id.toString()),
                            title: Text(partyList[index].name),
                            subtitle: Text(partyList[index].company.name),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: Colors.white,
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(),
        ));
  }
}
