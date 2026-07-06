//
//  CardMission.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 06/07/2026.
//

import SwiftUI

struct CardMission: View {

    var numero: Int
    var art: ArtDetails
    var isDiscovered: Bool
    var onMarkDiscovered: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {

            // Ouvre la fiche détail de l'œuvre.
            NavigationLink {
                StreetArtDetailView(art: art)
            } label: {
                HStack(alignment: .top, spacing: 12) {

                    // Numéro de la carte dans la mission.
                    Text("\(numero)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 28, height: 28)
                        .background(Circle().fill(Color.orange))

                    AsyncImage(url: URL(string: art.image)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.2)
                    }
                    .frame(width: 70, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .clipped()

                    VStack(alignment: .leading, spacing: 4) {
                        Text(art.title)
                            .font(.headline)
                            .foregroundColor(.black)

                        Text("Type : ").bold() + Text(art.type)
                        Text("Auteur : ").bold() + Text(art.Auteur)
                        Text("Lieu : ").bold() + Text(art.place)
                    }
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.8))

                    Spacer()
                }
            }
            .buttonStyle(.plain)

            // Permet de marquer l'œuvre comme découverte, une fois consultée.
            Button {
                onMarkDiscovered()
            } label: {
                Label(
                    isDiscovered ? "Découverte" : "Marquer comme découverte",
                    systemImage: isDiscovered ? "checkmark.circle.fill" : "circle"
                )
                .font(.subheadline.bold())
                .foregroundColor(isDiscovered ? .green : .orange)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(
                    (isDiscovered ? Color.green : Color.orange).opacity(0.15)
                )
                .cornerRadius(12)
            }
            .disabled(isDiscovered)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 6)
    }
}

#Preview {
    NavigationStack {
        CardMission(
            numero: 1,
            art: arts[0],
            isDiscovered: false,
            onMarkDiscovered: {}
        )
        .padding()
    }
}
