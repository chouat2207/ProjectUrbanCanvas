//
//  CarteView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//



import SwiftUI
import MapKit

struct CarteView: View {
    
    var onStreetSelected: (StreetLocalisation) -> Void
    
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 43.2964,
                longitude: 5.3754
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.08,
                longitudeDelta: 0.08
            )
        )
    )
    
    var body: some View {
        Map(position: $position) {
            
            ForEach(streetLocalisations) { location in
                
                Annotation(
                    location.nameStreet,
                    coordinate: CLLocationCoordinate2D(
                        latitude: location.Latitude,
                        longitude: location.Longitude
                    ),
                    anchor: .bottom
                ) {
                    
                    Button {
                        onStreetSelected(location)
                    } label: {
                        ZStack {
                            
                            Circle()
                                .fill(.orange)
                                .frame(width: 36, height: 36)
                            
                            Image(systemName: "figure.walk")
                                .foregroundStyle(.white)
                                .font(.system(size: 17))
                        }
                        .shadow(radius: 3)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CarteView { location in
        print(location.nameStreet)
    }
}
