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
    let art: ArtDetails
    
    // Action envoyée au parent quand on clique sur la flèche
    let onShowDetail: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
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
                
                Text(art.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .lineLimit(1)
                
                Spacer()
                
                Button {
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
