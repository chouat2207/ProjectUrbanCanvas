////
////  StreetArtListViewView.swift
////  ProjectUrbanCanvas
////
////  Created by Apprenant 77 on 03/07/2026.
////
//

import SwiftUI

struct StreetArtListView: View {

    @State private var selection: PickerView.Content = .liste
    // false = filtre caché, true = filtre affiché
    @State private var showFilters = false
    
    // Garde le filtre actuellement sélectionné.
    @State private var selectedFilter = "Tous"
    let filters = [
        "Tous",
        "Invaders",
        "Mosaïques",
        "Mural",
        "Stencil",
        "Calligraphie"
    ]
    
    var filteredArts: [ArtDetails] {
        if selectedFilter == "Tous" {
            return arts
            
        } else {
            
            // Sinon, on garde seulement les arts, dont le type correspond au filtre sélectionné.
            return arts.filter {
                $0.type == selectedFilter
            }
        }
    }

    
    var body: some View {
    
        NavigationStack {
     
            ZStack {
                
                // Couleur de fond de la vue.
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
         
                if selection == .liste {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        PickerFilterBar(
                            selection: $selection,
                            showFilters: $showFilters
                        )
                        
                                        Text("Liste des Street arts")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                
                        ScrollView {
                            
                      
                            VStack(spacing: 0) {
                                

                                ForEach(filteredArts) { art in
                        
                                    NavigationLink {
                                        
                          
                                        StreetArtDetailView(art: art)
                                        
                                    } label: {
                                        
                         
                                        HStack {
                      
                                            AsyncImage(
                                                url: URL(string: art.image)
                                            ) { image in
                                                
                                                
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                
                                            } placeholder: {
                                                
                                                
                                                Color.gray.opacity(0.2)
                                            }
                                            
                                            
                                            
                                            .frame(
                                                width: 60,
                                                height: 60
                                            )
                                            
                             
                                        
                                            .clipShape(Circle())
                                            
                                            
                              
                                            VStack(alignment: .leading) {
                                                
                               
                                                Text(art.title)
                                                    .font(.headline)
                                                    .foregroundColor(.black)
                                                
                                                
                                        
                                                HStack {
                                                    
                                                    Image(
                                                        systemName: "mappin.circle.fill"
                                                    )
                                                    .foregroundColor(.gray)
                                                    
                                                    Text(art.place)
                                                        .foregroundColor(.gray)
                                                        .lineLimit(1)
                                                }
                                                .font(.subheadline)
                                            }
                                            
                                            
                                            // Pousse le chevron complètement à droite.
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                        }
                                   
                                        .padding()
                                    }
                                    
                                    
                                    // Ligne de séparation.
                                    Divider()
                                }
                            }
                            
                            // Fond blanc de la liste.
                            .background(Color.white)
                           .cornerRadius(24)
                        
                            .padding()
                        }
                    }
                    
                    
                } else {
                    
                  
                    ZStack(alignment: .top) {
                        
                        
                        CarteWithDescriptionView()
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity
                            )
                        
                     
                        PickerFilterBar(
                            selection: $selection,
                            showFilters: $showFilters
                        )
                     
                        .padding(.top, 0)
                        
                        // Le Picker passe devant la carte.
                        .zIndex(1)
                    }
                }
                
         
                if showFilters {
                    
                    ZStack(alignment: .topTrailing) {
                        
                        // Fond noir transparent derrière la popup.
                        Color.black.opacity(0.25)
                            .ignoresSafeArea()
                            
                            // Quand on clique sur le fond,on ferme la fenêtre.
                            .onTapGesture {
                                showFilters = false
                            }
                        
                        
                        // Contenu de la popup.
                        VStack(alignment: .leading, spacing: 15) {
                                                        Text("Liste des filtres")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            
                            Text("Choisissez un type d’art")
                                .font(.body)
                            
                            
                            // Création automatique d'un bouton pour chaque filtre.
                            ForEach(filters, id: \.self) { filter in
                                
                                Button {
                                    
                                    // Enregistre le filtre choisi.
                                    selectedFilter = filter
                                    
                                    // Ferme la fenêtre.
                                    showFilters = false
                                    
                                } label: {
                                    
                                    Text(filter)
                                        
                                        // Si le filtre est sélectionné,son texte devient orange.
                                        .foregroundColor(
                                            filter == selectedFilter
                                                ? .orange
                                                : .black
                                        )
                                        
                                        // Le bouton prend toute la largeur.
                                        .frame(maxWidth: .infinity)
                                        
                                 
                                        .padding()
                                        
                                        // Fond gris.
                                        .background(
                                            Color.gray.opacity(0.2)
                                        )
                                 
                                        .cornerRadius(20)
                                }
                            }
                        }
                        .padding()
                        
                      
                        .frame(width: 280)
                        
                        // Effet transparent / flou.
                        .background(.ultraThinMaterial)
                        
                        .cornerRadius(28)
                        
                        // Décalage depuis le bord droit.
                        .padding(.trailing, 16)
                        .padding(.top, 70)
                    }
                    
                    // La fenêtre des filtres passe devant toutes les autres vues.
                    .zIndex(10)
                }
            }
        }
    }
}


#Preview {
    StreetArtListView()
}
