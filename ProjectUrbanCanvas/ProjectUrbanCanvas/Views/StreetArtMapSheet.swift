//
//  StreetArtMapSheet.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 05/07/2026.
//


import SwiftUI


struct StreetArtMapSheet: View {
    
    // Permet de fermer la sheet.
    // SwiftUI fournit automatiquement l'action dismiss grâce à Environment.
    @Environment(\.dismiss) private var dismiss
    
    let art: ArtDetails
    
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                
                HStack {
                    Button {
                        
                        // Ferme la sheet.
                        dismiss()
                        
                    } label: {
                        
                        Image(systemName: "xmark")
                            .font(.title3)
                            .foregroundStyle(.gray)
                            .frame(
                                width: 44,
                                height: 44
                            )
                            .background(
                                Color.gray.opacity(0.15)
                            )
                            .clipShape(Circle())
                    }
                    
                    // Pousse le titre vers le centre.
                    Spacer()
                    
                    Text(art.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    
                    // Limite le titre à une seule ligne.
                        .lineLimit(1)
                    
                    Spacer()
                  //  ForEach(arts){ art in
                        NavigationLink {
                            // page de Description complete
                            StreetArtDetailView(art: art)
                            
                        } label: {
                            
                            Image(systemName: "arrow.right")
                                .font(.title3)
                                .foregroundStyle(.white)
                                .frame(
                                    width: 44,
                                    height: 44
                                )
                                .background(.orange)
                                .clipShape(Circle())
                        }
                 //   }
                }
            }
            
            .padding()
            
            
            AsyncImage(
                url: URL(string: art.image)
            ) { image in
                
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
        
        // Fond blanc de la sheet.
        .background(Color.white)
    }
}


#Preview {
    
    StreetArtMapSheet(art: arts[0])
}
