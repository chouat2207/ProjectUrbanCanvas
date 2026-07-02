//
//  CarteView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

//import SwiftUI
//import MapKit
//
//struct CarteView: View {
//    var streetLocation = StreetLocalisation(nameStreet: "Liberté Égalité Fraternité", Latitude: 48.8958, Longitude: 2.3721)
//    var body: some View {
//        Map {
//            ForEach(streetLocation.nameStreet){location in
//                Marker(streetLocation.nameStreet, coordinate: <#T##CLLocationCoordinate2D#>(Latitude: streetLocation.Latitude, Longitude: streetLocation.Longitude))
//            }
//        }
//    }
//}
//#Preview {
//    CarteView()
//}


//import SwiftUI
//import MapKit
//
//struct CarteView: View {
//    var streetLocation: StreetLocalisation
//
//    var body: some View {
//        
//        Map {
//            Marker(
//                streetLocation.nameStreet,
//                coordinate: CLLocationCoordinate2D(
//                    latitude: streetLocation.latitude,
//                    longitude: streetLocation.longitude
//                )
//            )
//        }
//    }
//}
//
//#Preview {
//    CarteView(streetLocation: streetLocalisations[1])
////}
//import SwiftUI
//import MapKit
//
//struct CarteView: View {
//    var streetLocation: StreetLocalisation
//
//    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
//        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//    )
//
//    var body: some View {
//        Map(
//            ForEach(coordinateRegion: $region, annotationItems: [streetLocation])) { location in
//            MapMarker(
//                coordinate: CLLocationCoordinate2D(
//                    latitude: location.Latitude,
//                    longitude: location.Longitude
//                )
//            )
//        }
//        .onAppear {
//            region.center = CLLocationCoordinate2D(
//                latitude: streetLocation.Latitude,
//                longitude: streetLocation.Longitude
//            )
//        }
//    }
//}
//
//#Preview {
//    CarteView(streetLocation: streetLocalisations[1])
//}
