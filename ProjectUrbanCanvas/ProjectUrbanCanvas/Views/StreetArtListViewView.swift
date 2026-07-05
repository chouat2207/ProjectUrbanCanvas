////
////  StreetArtListViewView.swift
////  ProjectUrbanCanvas
////
////  Created by Apprenant 77 on 03/07/2026.
////
//

import SwiftUI

struct StreetArtListViewView: View {
    
    // MARK: - États de la vue
    
    // Garde le choix actuel du Picker.
    // Au démarrage, on affiche la liste.
    @State private var selection: PickerView.Content = .liste
    
    // Contrôle l'affichage de la fenêtre des filtres.
    // false = filtre caché
    // true = filtre affiché
    @State private var showFilters = false
    
    // Garde le filtre actuellement sélectionné.
    // Au démarrage, on affiche tous les street arts.
    @State private var selectedFilter = "Tous"
    
    
    // MARK: - Liste des filtres
    
    // Les différents types de street art proposés dans le filtre.
    let filters = [
        "Tous",
        "Invaders",
        "Mosaïques",
        "Mural",
        "Stencil",
        "Calligraphie"
    ]
    
    
    // MARK: - Street arts filtrés
    
    // Cette propriété retourne la liste des street arts
    // selon le filtre choisi par l'utilisateur.
    var filteredArts: [ArtDetails] {
        
        // Si l'utilisateur choisit "Tous",
        // on retourne le tableau complet "arts".
        if selectedFilter == "Tous" {
            return arts
            
        } else {
            
            // Sinon, on garde seulement les arts
            // dont le type correspond au filtre sélectionné.
            return arts.filter {
                $0.type == selectedFilter
            }
        }
    }
    
    
    // MARK: - Interface principale
    
    var body: some View {
        
        // NavigationStack permet d'utiliser NavigationLink
        // pour naviguer vers StreetArtDetailView.
        NavigationStack {
            
            // ZStack superpose plusieurs vues.
            // Ici :
            // - le fond
            // - la liste ou la carte
            // - la popup des filtres
            ZStack {
                
                // Couleur de fond de la vue.
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                
                // MARK: - Liste ou Carte
                
                // On regarde la valeur sélectionnée dans le Picker.
                if selection == .liste {
                    
                    // MARK: Mode LISTE
                    
                    // VStack place les vues verticalement :
                    //
                    // Picker
                    // ↓
                    // Titre
                    // ↓
                    // Liste
                    VStack(alignment: .leading, spacing: 0) {
                        
                        // Composant réutilisable contenant :
                        // - Picker Liste / Carte
                        // - bouton filtre
                        PickerFilterBar(
                            selection: $selection,
                            showFilters: $showFilters
                        )
                        
                        
                        // Titre de la page.
                        Text("Liste des Street arts")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        
                        // ScrollView permet de faire défiler la liste.
                        ScrollView {
                            
                            // VStack contient toutes les lignes.
                            // spacing: 0 enlève l'espace entre les lignes.
                            VStack(spacing: 0) {
                                
                                // Parcourt tous les street arts filtrés.
                                ForEach(filteredArts) { art in
                                    
                                    // NavigationLink permet d'ouvrir
                                    // la page de détail quand on clique.
                                    NavigationLink {
                                        
                                        // Destination.
                                        StreetArtDetailView(art: art)
                                        
                                    } label: {
                                        
                                        // Contenu visuel d'une ligne.
                                        HStack {
                                            
                                            // Charge l'image depuis une URL.
                                            AsyncImage(
                                                url: URL(string: art.image)
                                            ) { image in
                                                
                                                // Image chargée.
                                                image
                                                    .resizable()
                                                    .scaledToFill()
                                                
                                            } placeholder: {
                                                
                                                // Affiché pendant le chargement.
                                                Color.gray.opacity(0.2)
                                            }
                                            
                                            // Taille de l'image.
                                            .frame(
                                                width: 60,
                                                height: 60
                                            )
                                            
                                            // Transforme l'image en cercle.
                                            .clipShape(Circle())
                                            
                                            
                                            // Titre et lieu placés verticalement.
                                            VStack(alignment: .leading) {
                                                
                                                // Nom du street art.
                                                Text(art.title)
                                                    .font(.headline)
                                                    .foregroundColor(.black)
                                                
                                                
                                                // Icône + ville.
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
                                            
                                            
                                            // Flèche située à droite de la ligne.
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                        }
                                        
                                        // Espace intérieur de chaque ligne.
                                        .padding()
                                    }
                                    
                                    
                                    // Ligne de séparation.
                                    Divider()
                                }
                            }
                            
                            // Fond blanc de la liste.
                            .background(Color.white)
                            
                            // Coins arrondis.
                            .cornerRadius(24)
                            
                            // Espace autour de la liste.
                            .padding()
                        }
                    }
                    
                    
                } else {
                    
                    // MARK: Mode CARTE
                    
                    // ZStack permet de mettre le Picker
                    // au-dessus de la carte.
                    ZStack(alignment: .top) {
                        
                        // Affiche la carte.
                        // CarteWithDescriptionView gère aussi
                        // la sélection du marqueur et la sheet.
                        CarteWithDescriptionView()
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity
                            )
                        
                        
                        // Affiche le Picker au-dessus de la carte.
                        PickerFilterBar(
                            selection: $selection,
                            showFilters: $showFilters
                        )
                        
                        // Aucun espace supplémentaire en haut.
                        .padding(.top, 0)
                        
                        // Le Picker passe devant la carte.
                        .zIndex(1)
                    }
                }
                
                
                // MARK: - Fenêtre des filtres
                
                // La popup apparaît uniquement si
                // showFilters == true.
                if showFilters {
                    
                    // ZStack aligné en haut à droite.
                    // Cela permet de placer le filtre
                    // près du bouton filtre.
                    ZStack(alignment: .topTrailing) {
                        
                        // Fond noir transparent derrière la popup.
                        Color.black.opacity(0.25)
                            .ignoresSafeArea()
                            
                            // Quand on clique sur le fond,
                            // on ferme la fenêtre.
                            .onTapGesture {
                                showFilters = false
                            }
                        
                        
                        // Contenu de la popup.
                        VStack(alignment: .leading, spacing: 15) {
                            
                            // Titre.
                            Text("Liste des filtres")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                            
                            // Sous-titre.
                            Text("Choisissez un type d’art")
                                .font(.body)
                            
                            
                            // Création automatique d'un bouton
                            // pour chaque filtre.
                            ForEach(filters, id: \.self) { filter in
                                
                                Button {
                                    
                                    // Enregistre le filtre choisi.
                                    selectedFilter = filter
                                    
                                    // Ferme la fenêtre.
                                    showFilters = false
                                    
                                } label: {
                                    
                                    Text(filter)
                                        
                                        // Si le filtre est sélectionné,
                                        // son texte devient orange.
                                        .foregroundColor(
                                            filter == selectedFilter
                                                ? .orange
                                                : .black
                                        )
                                        
                                        // Le bouton prend toute la largeur.
                                        .frame(maxWidth: .infinity)
                                        
                                        // Espace intérieur.
                                        .padding()
                                        
                                        // Fond gris.
                                        .background(
                                            Color.gray.opacity(0.2)
                                        )
                                        
                                        // Coins arrondis.
                                        .cornerRadius(20)
                                }
                            }
                        }
                        
                        // Espace intérieur de la popup.
                        .padding()
                        
                        // Largeur fixe de la popup.
                        .frame(width: 280)
                        
                        // Effet transparent / flou.
                        .background(.ultraThinMaterial)
                        
                        // Coins arrondis.
                        .cornerRadius(28)
                        
                        // Décalage depuis le bord droit.
                        .padding(.trailing, 16)
                        
                        // Décalage depuis le haut.
                        .padding(.top, 70)
                    }
                    
                    // La fenêtre des filtres passe
                    // devant toutes les autres vues.
                    .zIndex(10)
                }
            }
        }
    }
}


#Preview {
    StreetArtListViewView()
}
