
//
//  StreetArtDetailView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//
import SwiftUI

struct StreetArtDetailView: View {
    var art: ArtDetails
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: art.image)
            ) { image in
                image
                    .resizable()
                
            } placeholder: {
                Color.gray.opacity(0.1)
            }
            .frame(height: 330)
            .frame(maxWidth: .infinity)
            .clipped()
            ScrollView {
                
                Text(art.title)
                    .font(.subheadline.bold())
                    .foregroundColor(.orange)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                    .padding(.bottom, 6)
                
                Text(art.description)
                    .font(.caption)
                    .foregroundColor(.black)
                
                    .opacity(0.8)
                
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                
                // Permet au texte de prendre plusieurs lignes.
                    .fixedSize(
                        horizontal: false,
                        vertical: true
                    )
                
                    .padding(.horizontal)
                
                VStack(
                    alignment: .leading,
                    spacing: 2
                ) {
                    Text("Type : ").bold()
                    + Text(art.type)
                    
                    
                    Text("Condition : ").bold()
                    + Text(art.condition)
                    
                    
                    Text("Date : ").bold()
                    + Text(art.date)
                    
                    
                    Text("Auteur : ").bold()
                    + Text(art.Auteur)
                    
                    Text("Localisation : ").bold()
                    + Text(
                        art.Localisation
                            .replacingOccurrences(
                                of: " (",
                                with: "\n("
                            )
                    )
                }
                .font(.caption)
                
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 12)
                Image(art.imageLocation)
                    .resizable()
                    .frame(
                        width: 350,
                        height: 200
                    )
                    .cornerRadius(20)
            }
        }
        .ignoresSafeArea()
    }
}
#Preview {
    
    StreetArtDetailView(art: arts[3])
}
