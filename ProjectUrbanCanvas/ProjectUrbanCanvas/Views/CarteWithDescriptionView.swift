//
//  CarteWithDescriptionView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//
//

import SwiftUI

struct CarteWithDescriptionView: View {
    
    // Art sélectionné sur la carte.
    // Quand cette variable contient un art,
    // la sheet s'ouvre.
    @State private var selectedArt: ArtDetails?
    
    // Art que l'on souhaite afficher
    // dans la page de détail complète.
    @State private var detailArt: ArtDetails?
    
    // Contrôle la navigation vers StreetArtDetailView.
    @State private var showDetail = false
    
    var body: some View {
        
        CarteView { location in
            
            // Quand on clique sur une annotation,
            // on cherche l'art qui possède le même nom.
            selectedArt = arts.first { art in
                art.title == location.nameStreet
            }
        }
        
        // MARK: - Navigation vers détail complet
        
        .navigationDestination(isPresented: $showDetail) {
            
            // Vérifie que detailArt contient un art.
            if let detailArt {
                
                // Affiche la page complète.
                StreetArtDetailView(art: detailArt)
            }
        }
        
        // MARK: - Sheet
        
        .sheet(item: $selectedArt) { art in
            
            // On affiche le résumé dans la sheet.
            StreetArtMapSheet(art: art) {
                
                // On garde l'art sélectionné
                // pour la page complète.
                detailArt = art
                
                // On ferme la sheet.
                selectedArt = nil
                
                // On attend un petit moment
                // que la sheet se ferme.
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + 0.3
                ) {
                    
                    // Puis on ouvre la page complète.
                    showDetail = true
                }
            }
            .presentationDetents([
                .fraction(0.40),
                .medium,
                .large
            ])
            .presentationDragIndicator(.visible)
            .presentationCornerRadius(28)
        }
    }
}

#Preview {
    NavigationStack {
        CarteWithDescriptionView()
    }
}
