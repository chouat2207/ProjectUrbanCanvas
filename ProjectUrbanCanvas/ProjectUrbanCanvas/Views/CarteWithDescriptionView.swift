//
//  CarteWithDescriptionView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI


struct CarteWithDescriptionView: View {
    
    // Stocke le street art sélectionné.
    //? signifie que la valeur est optionnel peut etre nil ou peut etre ArtDetail
    
    @State private var selectedArt: ArtDetails?
    
    
    var body: some View {
        
        CarteView { location in
            // lorsque CarteView appelle :onStreetSelected(location)
            selectedArt = arts.first { art in
                art.title == location.nameStreet
            }
        }
        // La sheet surveille selectedArt.
        // Si selectedArt == nil : la sheet est fermée.Si selectedArt contient un ArtDetails :la sheet s'ouvre.
        .sheet(item: $selectedArt) { art in
            
            // "art" représente ici le ArtDetails sélectionné.
            StreetArtMapSheet(art: art)
            // Définit les hauteurs possibles de la sheet.
                .presentationDetents([
                    // 45 % de l'écran.
                    .fraction(0.45),
                    // Environ la moitié.
                    .medium,
                    // Presque tout l'écran.
                    .large
                ])
            
            // Affiche la petite barre permettant de tirer la sheet.
                .presentationDragIndicator(.visible)
            // Arrondit le haut de la sheet.
                .presentationCornerRadius(28)
        }
    }
}

#Preview {
    CarteWithDescriptionView()
}
