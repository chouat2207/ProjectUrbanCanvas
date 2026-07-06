//
//  CarteView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//


import SwiftUI
import MapKit


struct CarteView: View {
    
    
    // Elle envoie un StreetLocalisation.
    var onStreetSelected: (StreetLocalisation) -> Void
    @State private var position: MapCameraPosition = .region(
        
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(  // Centre de la carte au démarrage.
                latitude: 43.2964,
                longitude: 5.3754
                                          ),
            
            span: MKCoordinateSpan(  // Niveau de zoom de la carte.
                latitudeDelta: 0.08,
                longitudeDelta: 0.08
                                  )
        )
    )
    var body: some View {
        
        
        Map(position: $position) {   // Affiche la carte.
            ForEach(streetLocalisations) { location in
                
                // Annotation permet de créer un marqueur personnalisé.
                Annotation(
                    location.nameStreet,
                    coordinate: CLLocationCoordinate2D(
                        latitude: location.Latitude,
                        longitude: location.Longitude
                    ),
                    
                    // Le bas du marqueur est placé exactement sur les coordonnées.
                    anchor: .bottom
                    
                ) {
                    
                    Button {
                        
                        onStreetSelected(location)
                        
                    } label: {
                        
                        // Apparence du marqueur.
                        ZStack {
                            Circle()
                                .fill(.orange)
                                .frame(
                                    width: 36,
                                    height: 36
                                )
                            
                            // Icône blanche.
                            Image(systemName: "figure.walk")
                                .foregroundStyle(.white)
                                .font(
                                    .system(size: 17)
                                )
                        }
                        .shadow(radius: 3)
                    }
                    
                    // Enlève le style classique d'un Button.
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
