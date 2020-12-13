import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _contactLocation = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(15.061169, -88.750052),
      tilt: 59.440717697143555,
      zoom: 18.151926040649414);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void addContactLocationMarker() {
    var markerIdVal = "contactLocationId";
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(15.061169, -88.750052),
      infoWindow: InfoWindow(
          title: 'Barberia Erick', snippet: 'Barrio El Progreso, La Entrada, Copán'),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  @override
  void initState() {
    addContactLocationMarker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ContactMap(
          contactLocation: _contactLocation,
          markers: markers,
          controller: _controller,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              SizedBox(height: 22),
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  child: new ContactLocation(),
                  onTap: _goToContactLocation,
                ),
              ),
              Divider(height: 24, color: Colors.black),
              new ContactHours(),
              Divider(height: 12, color: Colors.black),
              new ContactLinks(),
              SizedBox(height: 80),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _goToContactLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_contactLocation));
  }
}

class ContactLinks extends StatelessWidget {
  const ContactLinks({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 16),
        Text('Telefono: +504 9819-5153'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset(
            //   'assets/images/icons/twitter-48.png',
            //   height: 24.0,
            // ),
            Text('@correo.com'),
          ],
        ),
      ],
    );
  }
}

class ContactHours extends StatelessWidget {
  const ContactHours({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[Text('Dom'), Text('CERRADO')],
        ),
        Column(
          children: <Widget>[Text('Lun'), Text('8-5')],
        ),
        Column(
          children: <Widget>[Text('Mart'), Text('8-5')],
        ),
        Column(
          children: <Widget>[Text('Mie'), Text('8-5')],
        ),
        Column(
          children: <Widget>[Text('Jue'), Text('8-5')],
        ),
        Column(
          children: <Widget>[Text('Vie'), Text('8-10')],
        ),
        Column(
          children: <Widget>[Text('Sa'), Text('8-10')],
        ),
      ],
    );
  }
}

class ContactLocation extends StatelessWidget {
  const ContactLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.location_on,
              color: Colors.red[400],
              size: 42,
            ),
            Text('Ubicación: ', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(' Barrio El Progreso, La Entrada, Copán'),
          ],
        )
      ],
    );
  }
}

class ContactMap extends StatelessWidget {
  const ContactMap({
    Key key,
    @required CameraPosition contactLocation,
    @required this.markers,
    @required Completer<GoogleMapController> controller,
  })  : _contactLocation = contactLocation,
        _controller = controller,
        super(key: key);

  final CameraPosition _contactLocation;
  final Map<MarkerId, Marker> markers;
  final Completer<GoogleMapController> _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GoogleMap(
        mapType: MapType.hybrid,
        myLocationButtonEnabled: false,
        initialCameraPosition: _contactLocation,
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
