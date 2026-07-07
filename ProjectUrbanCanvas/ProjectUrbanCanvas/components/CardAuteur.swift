//
//  CardAuteur.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//
import SwiftUI
struct CardAuteur: View {
    var auteur = Auteurs(nom: "Kan DMV", image: "https://madeinmarseille.net/actualites-marseille/joconde-kan-dmv-fresque-saint-mauront.jpg", origins: "France", age: "49", style: "Pointilisme")
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: auteur.image)){ image
                in image
                    .resizable()
            }
            placeholder: {
                Color.gray.opacity(0.8)
            }
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .padding(.top, 5)
            Text(auteur.nom)
                .font(.title2)
                .foregroundColor(.orange)
                .fontWeight(.bold)
                .padding(2)
            Text("Age : ").bold() + Text("\(auteur.age) ans")
            Text("Origine : ").bold() + Text(auteur.origins)
            Text("Style : ").bold() + Text(auteur.style)
            
            Button(action: {
            }) {
                Text("Site web")
                    .padding()
                    .font(.title2)
                    .background(.orange)
                    .foregroundStyle(.white)
                    .cornerRadius(20)
                    .padding()
            }
            
        }
        .frame(width: 170, height: 350)
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 8)
    }
}
#Preview {
    CardAuteur()
}
