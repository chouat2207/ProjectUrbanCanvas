//
//  CarteView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//



import SwiftUI
import MapKit

// Cette vue affiche une carte avec les positions
// des différents street arts.
struct CarteView: View {
    
    // MARK: - Position de la caméra
    
    // @State permet à SwiftUI de surveiller la position de la carte.
    //
    // Si l'utilisateur déplace ou zoome sur la carte,
    // la valeur de "position" peut être mise à jour.
    @State private var position: MapCameraPosition = .region(
        
        // MKCoordinateRegion représente une zone géographique.
        MKCoordinateRegion(
            
            // MARK: Centre de la carte
            
            // Définit le point affiché au centre
            // lorsque la carte s'ouvre.
            center: CLLocationCoordinate2D(
                
                // Latitude de Marseille.
                latitude: 43.2964,
                
                // Longitude de Marseille.
                longitude: 5.3754
            ),
            
            
            // MARK: Niveau de zoom
            
            // MKCoordinateSpan définit la zone visible autour du centre.
            span: MKCoordinateSpan(
                
                // Plus cette valeur est petite,
                // plus la carte est zoomée.
                latitudeDelta: 0.08,
                
                // Même principe pour la longitude.
                longitudeDelta: 0.08
            )
        )
    )
    
    
    // MARK: - Interface
    
    var body: some View {
        
        // Map affiche une carte MapKit.
        //
        // $position signifie que la carte
        // peut lire ET modifier la variable "position".
        Map(position: $position) {
            
            // Parcourt toutes les localisations
            // présentes dans le tableau streetLocalisations.
            ForEach(streetLocalisations) { location in
                
                // Crée un marqueur pour chaque street art.
                Marker(
                    
                    // Nom affiché avec le marqueur.
                    location.nameStreet,
                    
                    // Position géographique du marqueur.
                    coordinate: CLLocationCoordinate2D(
                        
                        // Latitude venant de StreetLocalisation.
                        latitude: location.Latitude,
                        
                        // Longitude venant de StreetLocalisation.
                        longitude: location.Longitude
                    )
                )
                
                // Change la couleur du marqueur.
                .tint(.orange)
            }
        }
        
        // La carte peut utiliser tout l'écran,
        // même derrière les Safe Areas.
        .ignoresSafeArea()
    }
}


// MARK: - Preview

#Preview {
    CarteView()
}
