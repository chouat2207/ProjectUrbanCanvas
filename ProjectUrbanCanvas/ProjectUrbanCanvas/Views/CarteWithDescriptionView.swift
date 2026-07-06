//
//  CarteWithDescriptionView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI

struct CarteWithDescriptionView: View {
    
    @State private var selectedArt: ArtDetails?
    
    var body: some View {
        
        CarteView { location in
            
            selectedArt = arts.first { art in
                art.title == location.nameStreet
            }
        }
        .sheet(item: $selectedArt) { art in
            
            StreetArtMapSheet(art: art)
                .presentationDetents([
                    .fraction(0.45),
                    .medium,
                    .large
                ])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(28)
        }
    }
}

#Preview {
    CarteWithDescriptionView()
}
