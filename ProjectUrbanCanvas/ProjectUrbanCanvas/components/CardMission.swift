//
//  CardMission.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 06/07/2026.
//

import SwiftUI

struct CardMission: View {
    var mission =  ArtDetails(title: "Liberté Égalité Fraternité", description: "El Seed revient à Paris avec une œuvre puissante et engagée, visible depuis la rue Jeanne d'Arc. Fidèle à son langage singulier — le calligraffiti — l’artiste franco-tunisien, aujourd’hui reconnu à l’international, a marqué de nombreuses villes à travers le monde par ses fresques monumentales. Il avait déjà laissé une empreinte mémorable dans le 13e arrondissement lors de l'aventure de la Tour Paris 13.", image: "https://streetartcities.com/media/7/7bb12e51-88fe-47f2-ae3a-a0404dc91825/orig.jpg",
                              type: "Invaders", condition: "trés bonne", date: "Avril 2025", Auteur: "calligraffiti", Localisation: "Water tap, Square Gustave Mesureur, 105 Rue Jeanne d'Arc, 75013 Paris (Latitude : 48.8958, longitude : 2.3721)",imageLocation : "Liberté Égalité Fraternité", place: "Paris")
    var body: some View {
        VStack{
            HStack{
                AsyncImage(url: URL(string: mission.image)){ image
                    in image
                        .resizable()
                        .scaledToFill()
                }
                placeholder: {
                    Color.gray.opacity(0.8)
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                //.padding()
                Text(mission.title)
                    .font(.caption)
                    .foregroundColor(.orange)
                    .fontWeight(.bold)
                  //  .padding()
            }
            Text("Type : ").bold() + Text("\(mission.type) ans")
            Text("Auteur : ").bold() + Text(mission.Auteur)
            Text("Localisation : ").bold() + Text(mission.Localisation)
        }
        .frame(width: 300, height: 200)
        .background(.white)
        .cornerRadius(20)
        .shadow(radius: 8)
    }
}

#Preview {
    CardMission()
}
