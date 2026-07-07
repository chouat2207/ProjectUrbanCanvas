//
//  StreetArtRow.swift
//  Urban_Canvas
//
//  Created by Apprenant 77 on 01/07/2026.
//

import SwiftUI

struct StreetArtRow: View {
    var art: ArtDetails
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: art.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            }
            placeholder: {
                Color.gray.opacity(0.8)
            }
            .frame(width: 70, height: 70)
            .clipShape(Circle()) // faire l'image ronde
            
            VStack(alignment: .leading) {
                Text(art.title)
                    .font(.headline)
               
                Text("\(Image(systemName: "key.radiowaves.forward.fill"))  \(art.place)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary) //coleur de text gris 
            }
        }
    }
}
#Preview {
    StreetArtRow(art: arts[0])
}
