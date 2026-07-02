//
//  SwiftUIView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//


import SwiftUI

struct StreetArtListView: View {
    @State private var artStreet: StreetsArts = streetsArt[0]
    @State private var showFilters = false
    @State private var selectedFilter = "Tous"
    
    let filters = ["Tous", "Invaders", "Mosaïques", "Mural", "Stencil", "Calligraphie"]
    
    var filteredArts: [ArtDetails] {
        if selectedFilter == "Tous" {
            return arts
        } else {
            return arts.filter { $0.type == selectedFilter }
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Liste des Street arts")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {
                        showFilters = true
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 50)
                
                VStack {
                    ForEach(filteredArts) { art in
                        HStack {
                            AsyncImage(url: URL(string: art.image)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray.opacity(0.2)
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(art.title)
                                    .font(.headline)
                                
                                HStack {
                                    Image(systemName: "mappin.circle.fill")
                                        .foregroundColor(.gray)
                                    
                                    Text(artStreet.description)
                                        .foregroundColor(.gray)
                                }
                                .font(.subheadline)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        
                        Divider()
                    }
                }
                .background(Color.white)
                .cornerRadius(24)
                .padding()
                
                Spacer()
            }
            
            if showFilters {
                Color.black.opacity(0.25)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showFilters = false
                    }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Liste des filtres")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("Choisissez un type d’art")
                        .font(.body)
                    
                    ForEach(filters, id: \.self) { filter in
                        Button {
                            selectedFilter = filter
                            showFilters = false
                        } label: {
                            Text(filter)
                                .foregroundColor(filter == selectedFilter ? .orange : .black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(20)
                        }
                    }
                }
                .padding()
                .frame(width: 320)
                .background(.ultraThinMaterial)
                .cornerRadius(28)
                .position(x: 260, y: 300)
            }
            
        }
    }
}
#Preview {
    StreetArtListView()
}
