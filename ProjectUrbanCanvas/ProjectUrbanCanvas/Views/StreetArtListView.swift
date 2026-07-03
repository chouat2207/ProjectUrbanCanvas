////
////  SwiftUIView.swift
////  ProjectUrbanCanvas
////
////  Created by Apprenant 77 on 02/07/2026.
////
//
//import SwiftUI
//
//struct StreetArtListView: View {
//   // @State private var selection : PickerView.Content
//    @State private var selection: PickerView.Content = .liste
//
//    @State private var showFilters = false
//    @State private var selectedFilter = "Tous"
//    let filters = ["Tous", "Invaders", "Mosaïques", "Mural", "Stencil", "Calligraphie"]
//    
//    var filteredArts: [ArtDetails] {
//        if selectedFilter == "Tous" {
//            return arts
//        } else {
//            return arts.filter { $0.type == selectedFilter }
//        }
//    }
//    
//    var body: some View {
//       // PickerView(selection: $selection)
//        NavigationStack {
//            ZStack {
//                Color(.systemGroupedBackground)
//                    .ignoresSafeArea()
//                
//                VStack(alignment: .leading) {
//                    HStack{
//                        PickerView(selection: $selection)
//
//                        Button {
//                            showFilters = true
//                        } label: {
//                            Image(systemName: "line.3.horizontal.decrease.circle")
//                                .font(.title2)
//                                .foregroundColor(.black)
//                                .padding(10)
//                                .background(Color.white)
//                                .clipShape(Circle())
//                        }
//                    }
//                    .padding(.horizontal)
//
//                        Text("Liste des Street arts")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .padding(.horizontal)
//                    
//                    ScrollView {
//                        VStack {
//                            ForEach(filteredArts) { art in
//                                NavigationLink {
//                                    StreetArtDetailView(art: art)
//                                } label: {
//                                    HStack {
//                                        AsyncImage(url: URL(string: art.image)) { image in
//                                            image
//                                                .resizable()
//                                                .scaledToFill()
//                                        } placeholder: {
//                                            Color.gray.opacity(0.2)
//                                        }
//                                        .frame(width: 60, height: 60)
//                                        .clipShape(Circle())
//                                        
//                                        VStack(alignment: .leading) {
//                                            Text(art.title)
//                                                .font(.headline)
//                                                .foregroundColor(.black)
//                                            
//                                            HStack {
//                                                Image(systemName: "mappin.circle.fill")
//                                                    .foregroundColor(.gray)
//                                                
//                                                Text(art.place)
//                                                    .foregroundColor(.gray)
//                                                    .lineLimit(1)
//                                            }
//                                            .font(.subheadline)
//                                        }
//                                        
//                                        Spacer()
//                                        
//                                        Image(systemName: "chevron.right")
//                                            .foregroundColor(.gray)
//                                    }
//                                    .padding()
//                                }
//                                
//                                Divider()
//                            }
//                        }
//                        .background(Color.white)
//                        .cornerRadius(24)
//                        .padding()
//                    }
//                    
//                    Spacer()
//                }
//                
//                if showFilters {
//                    Color.black.opacity(0.25)
//                        .ignoresSafeArea()
//                        .onTapGesture {
//                            showFilters = false
//                        }
//                    
//                    VStack(alignment: .leading, spacing: 15) {
//                        Text("Liste des filtres")
//                            .font(.headline)
//                            .fontWeight(.bold)
//                        
//                        Text("Choisissez un type d’art")
//                            .font(.body)
//                        
//                        ForEach(filters, id: \.self) { filter in
//                            Button {
//                                selectedFilter = filter
//                                showFilters = false
//                            } label: {
//                                Text(filter)
//                                    .foregroundColor(filter == selectedFilter ? .orange : .black)
//                                    .frame(maxWidth: .infinity)
//                                    .padding()
//                                    .background(Color.gray.opacity(0.2))
//                                    .cornerRadius(20)
//                            }
//                        }
//                    }
//                    .padding()
//                    .frame(width: 320)
//                    .background(.ultraThinMaterial)
//                    .cornerRadius(28)
//                    .position(x: 260, y: 300)
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    StreetArtListView()
//}
