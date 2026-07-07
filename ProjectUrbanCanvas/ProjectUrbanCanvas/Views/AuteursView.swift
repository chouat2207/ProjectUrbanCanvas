//
//  AuteursView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI

struct AuteursView: View {
    var auteur = auteurs
    let columnss = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible() , spacing: 10),
    ]
    var body: some View {
        ScrollView {                             //permettre de scroller dans une vue
            LazyVGrid(columns: columnss, spacing: 20) {   //afficher sous forme de lignes et des colonnes
                ForEach(auteur) { item in
                    CardAuteur(auteur: item)
                }
            }
            .padding(.horizontal)
        }
        
    }
}
#Preview {
    AuteursView()
}


