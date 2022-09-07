import 'package:flutter/material.dart';
import 'package:proj_ver1/ImboxPage/imbox_page_screen.dart';
import 'package:proj_ver1/RidesPage/rides_page_screen.dart';
import 'package:proj_ver1/SettingsPage/settings_page_screen.dart';
// import 'package:proj_ver1/TutorialPage/tutorial_page_screen.dart';
import 'package:proj_ver1/UserPage/user_page_screen.dart';
import 'package:proj_ver1/UserRidesPage/user_rides_page_screen.dart';
import 'package:proj_ver1/constants.dart';
import 'package:proj_ver1/responsive.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileMainPage(),
    );
  }
}

class MobileMainPage extends StatefulWidget {
  const MobileMainPage({Key? key}) : super(key: key);

  @override
  State<MobileMainPage> createState() => MobileMainPageState();
}

class MobileMainPageState extends State<MobileMainPage> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    final children = [
      const RidesPage(),
      const UserRidesPage(),
      const ImboxPage()
    ];
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Inicio"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(indexSelected == 2 ? Icons.settings : Icons.search))
        ],
      ),
      drawer: const NavigationDrawer(),
      body: children[indexSelected],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kPrimaryColor,
        fixedColor: Colors.white,
        currentIndex: indexSelected,
        onTap: (index) => setState(() => indexSelected = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Viajes"),
          BottomNavigationBarItem(icon: Icon(Icons.drive_eta), label: "Mis viajes"),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: "Mensajes")
        ],
      ),
    );
  }
}

// class MainScreen extends StatefulWidget {
// const MainScreen({Key? key}) : super(key: key);

// @override
// State<MainScreen> createState() => MainScreenState();
// }

// class MainScreenState extends State<MainScreen> {
// static const double _defaultLat = 8.85577417427599;
// static const double _defaultLng = 38.81151398296511;

// static const CameraPosition _defaultLocation =
// CameraPosition(target: LatLng(_defaultLat, _defaultLng), zoom: 15);

// late final GoogleMapController _googleMapController;
// MapType _currentMapType = MapType.normal;
// final Set<Marker> _markers = {};

// void _changeMapType() {
// setState(() {
// _currentMapType = _currentMapType == MapType.normal
// ? MapType.satellite
// : MapType.normal;
// });
// }

// void _addMarker() {
// setState(() {
// _markers.add(
// Marker(
// markerId: MarkerId('defaultLocation'),
// position: _defaultLocation.target,
// icon: BitmapDescriptor.defaultMarker,
// infoWindow: const InfoWindow(
// title: 'Really cool place',
// snippet: '5 Star Rating',
// ),
// ),
// );
// });
// }

// Future<void> _moveToNewLocation() async {
// const _newPosition = LatLng(40.7128, -74.0060);
// _googleMapController
// .animateCamera(CameraUpdate.newLatLngZoom(_newPosition, 15));
// setState(() {
// const marker = Marker(
// markerId: MarkerId('newLocation'),
// position: _newPosition,
// infoWindow: InfoWindow(title: 'New York', snippet: 'The Best Place'),
// );

// _markers
// ..clear()
// ..add(marker);
// });
// }

// Future<void> _goToDefaultLocation() async {
// const _defaultPosition = LatLng(_defaultLat, _defaultLng);
// _googleMapController
// .animateCamera(CameraUpdate.newLatLngZoom(_defaultPosition, 15));
// setState(() {
// const marker = Marker(
// markerId: MarkerId('My Default Location'),
// position: _defaultPosition,
// infoWindow: InfoWindow(title: 'Home', snippet: 'The Best Place'),
// );

// _markers
// ..clear()
// ..add(marker);
// });
// }
// @override
// Widget build(BuildContext context) => Stack(
// children: <Widget>[
// GoogleMap(
// onMapCreated: (controller) => _googleMapController = controller,
// initialCameraPosition: _defaultLocation,
// mapType: _currentMapType,
// markers: _markers,
// ),
// Container(
// padding: const EdgeInsets.only(top: 24, right: 12),
// alignment: Alignment.topRight,
// child: Column(
// children: <Widget>[
// FloatingActionButton(
// onPressed: _changeMapType,
// backgroundColor: Colors.green,
// child: const Icon(Icons.map, size: 30.0),
// ),
// const SizedBox(height: 20.0),
// FloatingActionButton(
// onPressed: _addMarker,
// backgroundColor: Colors.deepPurpleAccent,
// child: const Icon(Icons.add_location, size: 36.0),
// ),
// const SizedBox(height: 20.0),
// FloatingActionButton(
// onPressed: _moveToNewLocation,
// backgroundColor: Colors.indigoAccent,
// child: const Icon(Icons.location_city, size: 36.0),
// ),
// const SizedBox(height: 20.0),
// FloatingActionButton(
// onPressed: _goToDefaultLocation,
// backgroundColor: Colors.red,
// child: const Icon(Icons.home_rounded, size: 36.0),
// ),
// ],
// ),
// ),
// ],
// );
// }

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(30))),
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          // Navigator.pop(context);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const UserPage()));
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [
                    kPrimaryColor,
                    Color.fromARGB(255, 232, 248, 231)
                  ]),
              color: kPrimaryLightColor,
              border: Border.all(width: 1, color: kPrimaryLightColor),
              borderRadius:
                  const BorderRadius.only(bottomRight: Radius.circular(30))),
          padding: EdgeInsets.only(
              top: 15 + MediaQuery.of(context).padding.top,
              bottom: 30,
              left: 30),
          child: Row(
            children: const <Widget>[
              Expanded(
                flex: 1,
                // child: Align(
                // alignment: Alignment.center,
                child: Text("Liliana Paola Castellanos Pinzón",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                // ),
              ),
              Expanded(
                // child: Align(
                // alignment: Alignment.centerRight,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1661544641467-d1811f77c71e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=650&q=80'),
                ),
                // )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 15, bottom: 30),
      child: Wrap(
        runSpacing: 8,
        children: [
          // ListTile(
          // leading: const Icon(Icons.drive_eta, color: Colors.black87),
          // title: const Text("Mis Viajes"),
          // onTap: () {
          // Navigator.pop(context);
          // Navigator.of(context).push(MaterialPageRoute(
          // builder: (context) => const UserRidesPage()));
          // }),
          // ListTile(
          // leading: const Icon(Icons.alarm, color: Colors.black87),
          // title: const Text("Viajes Programados"),
          // onTap: () {
          // Navigator.pop(context);
          // Navigator.of(context).push(
          // MaterialPageRoute(builder: (context) => const RidesPage()));
          // }),
          // ListTile(
              // leading: const Icon(Icons.email, color: Colors.black87),
              // title: const Text("Mensajes"),
              // onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(
                    // MaterialPageRoute(builder: (context) => const ImboxPage()));
              // }),
          ListTile(
              leading: const Icon(Icons.camera, color: Colors.black87),
              title: const Text("Tutorial"),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                // builder: (context) => const TutorialPage()));
              }),
          ListTile(
              leading: const Icon(Icons.settings, color: Colors.black87),
              title: const Text("Configuración"),
              onTap: () {
                // Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsPage()));
              }),
        ],
      ),
    );
  }
}
