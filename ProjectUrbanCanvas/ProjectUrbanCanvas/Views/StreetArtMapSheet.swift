////
////  StreetArtMapSheet.swift
////  ProjectUrbanCanvas
////
////  Created by Apprenant 77 on 05/07/2026.
////

import SwiftUI

struct StreetArtMapSheet: View {
    
    // Permet de fermer la sheet
    @Environment(\.dismiss) private var dismiss
    
    // Street art sélectionné
    let art: ArtDetails
    
    // Action envoyée au parent
    // quand on clique sur la flèche
    let onShowDetail: () -> Void
    
    var body: some View {
        
        // ✅ UN SEUL VStack contient tout
        VStack(spacing: 0) {
            
            // MARK: - Header
            
            HStack {
                
                // Bouton X
                Button {
                    print("❌ Clic sur X")
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                        .foregroundStyle(.gray)
                        .frame(width: 44, height: 44)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
                
                Spacer()
                
                // Titre
                Text(art.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .lineLimit(1)
                
                Spacer()
                
                // Bouton flèche
                Button {
                    print("➡️ Clic sur flèche")
                    onShowDetail()
                } label: {
                    Image(systemName: "arrow.right")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(Color.orange)
                        .clipShape(Circle())
                }
                .buttonStyle(.plain)
            }
            .padding()
            .zIndex(1)
            
            
            // MARK: - Image
            
            AsyncImage(url: URL(string: art.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ZStack {
                    Color.gray.opacity(0.2)
                    
                    ProgressView()
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 220)
            .clipped()
            
            
            // MARK: - Description
            
            ScrollView {
                Text(art.description)
                    .font(.body)
                    .foregroundStyle(.black)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding()
            }
        }
        .background(Color.white)
    }
}

#Preview {
    StreetArtMapSheet(
        art: arts[0],
        onShowDetail: {
            print("Afficher détail")
        }
    )
}
