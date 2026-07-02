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
//
//import SwiftUI
//import MapKit
//
//struct CarteView: View {
//    var streetLocation = StreetLocalisation(
//        nameStreet: "Liberté Égalité Fraternité",
//        Latitude: 48.8958,
//        Longitude: 2.3721
//    )
//
//    var body: some View {
//        Map {
//            
//            Marker(
//                streetLocation.nameStreet,
//                coordinate: CLLocationCoordinate2D(
//                    latitude: streetLocation.Latitude,
//                    longitude: streetLocation.Longitude
//                )
//            )
//        }
////        .frame(width:200 ,height: 300)
//    }
//}
//
//#Preview {
//    CarteView()
//}


//import SwiftUI
//import MapKit
//
//struct CarteView: View {
//    var body: some View {
//        Map {
//            ForEach(streetLocalisations) { location in
//                Marker(
//                    location.nameStreet,
//                    coordinate: CLLocationCoordinate2D(
//                        latitude: location.Latitude,
//                        longitude: location.Longitude
//                    )
//                )
//            }
//        }
//    }
//}
//
//#Preview {
//    CarteView()
//}



import SwiftUI
import MapKit

struct CarteView: View {
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D( //C’est le centre de la carte au démarrage.
                latitude: 43.2964,
                longitude: 5.3754
            ),
            span: MKCoordinateSpan( //correspond à une position à Marseille.
                latitudeDelta: 0.08,
                longitudeDelta: 0.08
            )
        )
    )

    var body: some View {
        Map(position: $position) {
            ForEach(streetLocalisations) { location in
                Marker(
                    location.nameStreet,
                    coordinate: CLLocationCoordinate2D(
                        latitude: location.Latitude,
                        longitude: location.Longitude
                    )
                )
                .tint(.orange)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CarteView()
}
