//
//  CarteWithDescriptionView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI


struct CarteWithDescriptionView: View {
    @State private var selectedArt: ArtDetails?   //? signifie que la valeur est optionnel peut etre nil ou peut etre ArtDetail
    
    var body: some View {
        
        CarteView { location in
            selectedArt = arts.first { art in
                art.title == location.nameStreet
            }
        }
        // La sheet surveille selectedArt. Si selectedArt == nil : la sheet est fermée.Si selectedArt contient un ArtDetails :la sheet s'ouvre.
        .sheet(item: $selectedArt) { art in
            StreetArtMapSheet(art: art)  // "art" représente ici le ArtDetails sélectionné.
                .presentationDetents([                  // Définit les hauteurs possibles de la sheet.
                    .fraction(0.40),                     // 40 % de l'écran.
                    .medium,                            // Environ la moitié.
                    .large                              // Presque tout l'écran.
                ])
                .presentationDragIndicator(.visible)    // Affiche la petite barre permettant de tirer la sheet.
            
                .presentationCornerRadius(28)   // Arrondit le haut de la sheet.
        }
    }
}

#Preview {
    CarteWithDescriptionView()
}
