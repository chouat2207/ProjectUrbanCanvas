//
//  AuteursView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI

struct AuteursView: View {
    var auteur = auteurs
    let columns = [
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible() , spacing: 10),
      ]
    var body: some View {
        ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
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


