//
//  StreetArtDetailView.swift
//  Urban_Canvas
//
//  Created by Apprenant 77 on 01/07/2026.
//

import SwiftUI
struct StreetArtDetailView: View {
    var art: Art
    var body: some View {
            VStack{
                AsyncImage(url: URL(string: art.image))
                { image in
                    image
                        .resizable()
                        .scaledToFill()

                }
                placeholder: {
                    Color.gray.opacity(0.1)
                }
                .frame(height: 330)
                .frame(maxWidth: .infinity)
                .clipped()
                Text(art.title)
                    .font(.headline)
                    .foregroundColor(.orange)
                Text(art.description)
                    .font(.body)
                    .foregroundColor(.black)
                    .opacity(0.8)
                    .minimumScaleFactor(0.6)
                    .padding(.horizontal)
                VStack(alignment: .leading){
                    Text("Type : ").bold() + Text(art.type)
                    Text("Condition : ").bold() + Text(art.condition)
                    Text("Date : ").bold() + Text(art.date)
                    Text("Auteur : ").bold() + Text(art.Auteur)
                    Text("Localisation : ").bold() + Text(art.Localisation)
                }
                .padding(.horizontal)
                Image(art.imageLocation)
                    .resizable()
                    .frame(width: 350, height: 200)
                   .cornerRadius(20)


            }
            .ignoresSafeArea()
        }
    }

#Preview {
    StreetArtDetailView(art: arts[1])
}
