//
//  CarteView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//



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
