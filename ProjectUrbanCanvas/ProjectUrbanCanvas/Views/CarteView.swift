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

    // @State car la position peut changer
    // quand l'utilisateur déplace ou zoome la carte.
    @State private var position: MapCameraPosition = .region(
        
        MKCoordinateRegion(
            
            // Centre de la carte au démarrage.
            center: CLLocationCoordinate2D(
                latitude: 43.2964,
                longitude: 5.3754
            ),
            
            // Niveau de zoom de la carte.
            span: MKCoordinateSpan(
                latitudeDelta: 0.08,
                longitudeDelta: 0.08
            )
        )
    )
    var body: some View {
        
        // Affiche la carte.
        Map(position: $position) {
            
            // Parcourt toutes les localisations
            ForEach(streetLocalisations) { location in
                
                // Annotation permet de créer
                // un marqueur personnalisé.
                Annotation(
                        location.nameStreet,
                coordinate: CLLocationCoordinate2D(
                        latitude: location.Latitude,
                        longitude: location.Longitude
                    ),
                    
                    // Le bas du marqueur est placé
                    // exactement sur les coordonnées.
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
                        
                        // Petite ombre sous le marqueur.
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
