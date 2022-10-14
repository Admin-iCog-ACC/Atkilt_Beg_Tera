import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:latlong2/latlong.dart' as latlng;
import 'package:location/location.dart' as Location;
import 'package:geocoding/geocoding.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String mapBoxAccessToken =
      'pk.eyJ1IjoiYWxhc3dhYWQ5OSIsImEiOiJjbDhjNHF2bm4weGx0M25wYmJzb25xaHBnIn0.ycuZQ8aHFvWzHUwRMGqT3w';
  String hintText = "Your Current Location";
  String mapBoxStyleId = 'cl8csi09200iq14o6xwlhpz1m';
  // late MapboxMapController _mapController;
  // LatLng? myLocation = LatLng(8.992486, 38.685581);
  final _startPointController = TextEditingController();
  bool? isLoading;
  bool switchMap = false;
  LatLng? myLocation;

  String googleApikey = "AIzaSyCLkOwYt9Ca7we8Lru4CFcav4wt9SGLV8U";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(27.6602292, 85.308027);
  String location = "Location Name:";

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // setState(() {
    isLoading = true;
    _getCurrentLocation();
    // });
    // });
    // _mapController = MapController();
  }

  // _onMapCreated(MapboxMapController controller) async {
  //   _mapController = controller;
  // }

  _getCurrentLocation() async {
    Location.Location location = new Location.Location();
    bool _serviceEnabled;
    Location.PermissionStatus _permissionGranted;
    Location.LocationData? _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == Location.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != Location.PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {
      myLocation = LatLng(_locationData!.latitude!, _locationData!.longitude!);
      isLoading = false;
    });
    // _mapController.move(myLocation!, 16.0);
    print(myLocation);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Positioned(
      //   bottom: MediaQuery.of(context).size.height * .22,
      //   child: FloatingActionButton(
      //       onPressed: () {
      //         setState(() {
      //           switchMap = !switchMap;
      //         });
      //       },
      //       child: Icon(Icons.map)),
      // ),
      body: isLoading!
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : Stack(
              children: [
                // MapboxMap(
                //   styleString:
                //       'mapbox://styles/alaswaad99/cl8csi09200iq14o6xwlhpz1m',
                //   accessToken: dotenv.get('MAPBOX_ACCESS_TOKEN'),
                //   onMapCreated: _onMapCreated,
                //   myLocationEnabled: true,
                //   // trackCameraPosition: true,
                //   dragEnabled: false,
                //   initialCameraPosition: CameraPosition(
                //     target: LatLng(
                //       myLocation!.latitude,
                //       myLocation!.longitude,
                //     ),
                //     zoom: 15.0,
                //   ),
                //   onMapClick: (_, latlng) async {
                //     await _mapController.animateCamera(
                //       CameraUpdate.newCameraPosition(
                //         CameraPosition(
                //           bearing: 10.0,
                //           target: LatLng(
                //             latlng.latitude,
                //             latlng.longitude,
                //           ),
                //           tilt: 30.0,
                //           zoom: 15.0,
                //         ),
                //       ),
                //     );
                //   },
                // ),
                GoogleMap(
                  //Map widget from google_maps_flutter package
                  zoomGesturesEnabled: true, //enable Zoom in, out on map
                  initialCameraPosition: CameraPosition(
                    //innital position in map
                    target: LatLng(myLocation!.latitude, myLocation!.longitude),
                    //initial position
                    zoom: 15.0, //initial zoom level
                  ),
                  mapType: MapType.normal, //map type
                  onMapCreated: (controller) {
                    //method called when map is created
                    setState(() {
                      mapController = controller;
                    });
                  },
                  onCameraMove: (CameraPosition cameraPositiona) {
                    cameraPosition = cameraPositiona; //when map is dragging
                  },
                  onCameraIdle: () async {
                    //when map drag stops
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        cameraPosition!.target.latitude,
                        cameraPosition!.target.longitude);
                    setState(() {
                      //get place name from lat and lang
                      location =
                          placemarks.first.administrativeArea.toString() +
                              ", " +
                              placemarks.first.street.toString();
                    });
                  },
                ),
                // switchMap
                //     ? FlutterMap(
                //         options: MapOptions(
                //           minZoom: 5,
                //           maxZoom: 15,
                //           zoom: 15,
                //           center: latlng.LatLng(
                //               myLocation!.latitude, myLocation!.longitude),
                //         ),
                //         children: [
                //           TileLayer(
                //             urlTemplate:
                //                 'https://api.mapbox.com/styles/v1/alaswaad99/cl8csi09200iq14o6xwlhpz1m/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWxhc3dhYWQ5OSIsImEiOiJjbDhjNHF2bm4weGx0M25wYmJzb25xaHBnIn0.ycuZQ8aHFvWzHUwRMGqT3w',
                //             additionalOptions: {
                //               'mapStyleId': mapBoxStyleId,
                //               'accessToken': mapBoxAccessToken,
                //             },
                //           ),
                //         ],
                //       )
                //     : GoogleMap(
                //         //Map widget from google_maps_flutter package
                //         zoomGesturesEnabled: true, //enable Zoom in, out on map
                //         initialCameraPosition: CameraPosition(
                //           //innital position in map
                //           target: LatLng(
                //               myLocation!.latitude, myLocation!.longitude),
                //           //initial position
                //           zoom: 15.0, //initial zoom level
                //         ),
                //         mapType: MapType.normal, //map type
                //         onMapCreated: (controller) {
                //           //method called when map is created
                //           setState(() {
                //             mapController = controller;
                //           });
                //         },
                //         onCameraMove: (CameraPosition cameraPositiona) {
                //           cameraPosition =
                //               cameraPositiona; //when map is dragging
                //         },
                //         onCameraIdle: () async {
                //           //when map drag stops
                //           List<Placemark> placemarks =
                //               await placemarkFromCoordinates(
                //                   cameraPosition!.target.latitude,
                //                   cameraPosition!.target.longitude);
                //           setState(() {
                //             //get place name from lat and lang
                //             location =
                //                 placemarks.first.administrativeArea.toString() +
                //                     ", " +
                //                     placemarks.first.street.toString();
                //           });
                //         },
                //       ),

                Positioned(
                  bottom: 0,
                  left: 5,
                  right: 5,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 5, bottom: 15, top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      // if (switchMap) {
                                      //   mapbox_search.MapBoxPlace result =
                                      //       await showSearch(
                                      //           context: context,
                                      //           delegate: MapSearchDelegate());
                                      //   setState(() {
                                      //     myLocation = LatLng(
                                      //         result.center![0], result.center![1]);
                                      //     hintText = result.placeName!;
                                      //   });
                                      // } else {
                                      var place = await PlacesAutocomplete.show(
                                          context: context,
                                          apiKey: googleApikey,
                                          mode: Mode.fullscreen,
                                          cursorColor: Colors.red,
                                          logo: SizedBox.shrink(),
                                          types: [],
                                          strictbounds: false,
                                          textDecoration: InputDecoration(
                                            hintText: 'Search',
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          components: [
                                            Component(Component.country, 'et')
                                          ],
                                          //google_map_webservice package
                                          onError: (err) {
                                            print(err);
                                          });

                                      if (place != null) {
                                        setState(() {
                                          location =
                                              place.description.toString();
                                          hintText =
                                              place.description.toString();
                                        });

                                        //form google_maps_webservice package
                                        final plist = GoogleMapsPlaces(
                                          apiKey: googleApikey,
                                          apiHeaders: await GoogleApiHeaders()
                                              .getHeaders(),
                                          //from google_api_headers package
                                        );
                                        String placeid = place.placeId ?? "0";
                                        final detail = await plist
                                            .getDetailsByPlaceId(placeid);
                                        final geometry =
                                            detail.result.geometry!;
                                        final lat = geometry.location.lat;
                                        final lang = geometry.location.lng;
                                        var newlatlang = LatLng(lat, lang);

                                        //move map camera to selected place with animation
                                        mapController?.animateCamera(
                                            CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                                    target: newlatlang,
                                                    zoom: 17)));
                                        // }
                                        setState(() {
                                          myLocation = newlatlang;
                                        });
                                      }
                                    },
                                    child: TextField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: hintText,
                                      ),

                                      //   style: TextStyle(
                                      //       fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(hintText);
                                    },
                                    icon: Icon(Icons.check))
                              ],
                            ),
                            // CustomTextField(
                            //   hintText: "Select starting point",
                            //   textController: _startPointController,
                            //   onTap: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) =>
                            //             MapBoxAutoCompleteWidget(
                            //           apiKey: mapBoxAccessToken,
                            //           hint: "Select starting point",
                            //           onSelect: (place) {
                            //             // TODO : Process the result gotten
                            //             _startPointController.text =
                            //                 place.placeName!;
                            //           },
                            //           limit: 5,
                            //           country: "ET",

                            //           // location: ,
                            //         ),
                            //       ),
                            //     );
                            //   },
                            //   enabled: true,
                            // ),
                            // ),
                            SizedBox(height: 15),
                            Text(hintText == "Your Current Location"
                                ? 'You are currently here:'
                                : 'Selected Location:'),
                            Text(
                                'Longitude: ${myLocation!.longitude} - Latitude: ${myLocation!.latitude}',
                                style: const TextStyle(color: Colors.indigo)),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //     bottom: MediaQuery.of(context).size.height * .22,
                //     right: 10,
                //     child: Column(
                //       children: [
                //         FloatingActionButton(
                //           heroTag: "zoom_in_tag",
                //           onPressed: () async =>
                //               await _mapController.animateCamera(
                //             CameraUpdate.zoomIn(),
                //           ),
                //           child: const Icon(Icons.zoom_in),
                //         ),
                //         const SizedBox(height: 8.0),
                //         FloatingActionButton(
                //           heroTag: "zoom_out_tag",
                //           onPressed: () async =>
                //               await _mapController.animateCamera(
                //             CameraUpdate.zoomOut(),
                //           ),
                //           child: const Icon(Icons.zoom_out),
                //         ),
                //       ],
                //     )),
              ],
            ),
    );
  }
}

// class MapSearchDelegate extends SearchDelegate {
//   var placesSearch = mapbox_search.PlacesSearch(
//     apiKey: dotenv.get('MAPBOX_ACCESS_TOKEN'),
//     limit: 5,
//     country: 'ET',
//   );
//   Future<List<mapbox_search.MapBoxPlace>?> getPlaces(String query) =>
//       placesSearch.getPlaces(query);
//   Future<List<mapbox_search.MapBoxPlace>?>? result;
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     // throw UnimplementedError();
//     return [
//       IconButton(
//           onPressed: () {
//             if (query == '')
//               close(context, null);
//             else
//               query = '';
//           },
//           icon: Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     // throw UnimplementedError();
//     return IconButton(
//         onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     // throw UnimplementedError();
//     // if (query == '')
//     // List<mapbox_search.MapBoxPlace>? suggestions;
//     // getPlaces(query).then((value) => suggestions = value);
//     // print('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n$suggestions');
//     return FutureBuilder(
//         future: getPlaces(query),
//         builder: (BuildContext context,
//             AsyncSnapshot<List<mapbox_search.MapBoxPlace>?> snapshot) {
//           if (snapshot.hasData)
//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 // itemCount: 5,
//                 itemBuilder: (context, index) {
//                   final suggestion = snapshot.data?[index];
//                   return ListTile(
//                     title: Text(
//                         '${suggestion != null ? suggestion.placeName! : snapshot.data?.length}'),
//                     onTap: () {
//                       //   query =
//                       //       '${suggestion != null ? suggestion.placeName! : "nothing"}';
//                       // },
//                       close(context, suggestion);
//                     },
//                   );
//                   // return ListTile(
//                   //   title: Text(index.toString()),
//                   //   onTap: () {
//                   //     query = index.toString();
//                   //   },
//                   // );
//                 });
//           return SizedBox.shrink();
//         });

//     // return StatefulBuilder(
//     //     builder: (BuildContext context, StateSetter setState) {
//     //   //     return CheckboxListTile(
//     //   //         title: const Text('Item'),
//     //   //         value: _isItemSelected,
//     //   //         onChanged: (bool newValue) {
//     //   //             setState(() {
//     //   //                 _isItemSelected = newValue;
//     //   //             });
//     //   //         },
//     //   // );
//     // });
//   }

//   // void _retry() {
//   //   setState(() {
//   //     result = doSomeLongRunningCalculation();
//   //   });
//   // }
// }
