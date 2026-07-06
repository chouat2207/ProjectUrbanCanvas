//
//  StreetArtMapSheet.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 05/07/2026.
//


import SwiftUI

struct StreetArtMapSheet: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let art: ArtDetails
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Header
            
            HStack {
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                        .foregroundStyle(.gray)
                        .frame(width: 44, height: 44)
                        .background(
                            Color.gray.opacity(0.15)
                        )
                        .clipShape(Circle())
                }
                
                Spacer()
                
                Text(art.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .lineLimit(1)
                
                Spacer()
                
                NavigationLink {
                    StreetArtDetailView(art: art)
                } label: {
                    Image(systemName: "arrow.right")
                        .font(.title3)
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(.orange)
                        .clipShape(Circle())
                }
            }
            .padding()
            
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
    NavigationStack {
        StreetArtMapSheet(art: arts[0])
    }
}
