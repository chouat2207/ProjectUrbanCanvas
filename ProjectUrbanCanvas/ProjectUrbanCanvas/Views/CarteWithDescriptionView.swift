//
//  CarteWithDescriptionView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//
//

import SwiftUI

struct CarteWithDescriptionView: View {
    @State private var selectedArt: ArtDetails?
    @State private var detailArt: ArtDetails?
    @State private var showDetail = false
    
    var body: some View {
        CarteView { location in
            // Quand on clique sur une annotation, on cherche l'art qui possède le même nom.
            selectedArt = arts.first { art in
                art.title == location.nameStreet
            }
        }
        .navigationDestination(isPresented: $showDetail) { // Navigation vers détail complet
            if let detailArt {             // Vérifie que detailArt contient un art.
                            StreetArtDetailView(art: detailArt)
            }
        }
        .sheet(item: $selectedArt) { art in
            StreetArtMapSheet(art: art) {
                detailArt = art
                selectedArt = nil // On ferme la sheet.
                DispatchQueue.main.asyncAfter(    // On attend un petit moment que la sheet se ferme.
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
