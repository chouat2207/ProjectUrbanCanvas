
//
//  StreetArtDetailView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//
import SwiftUI

// Cette vue affiche les détails d'un street art.
struct StreetArtDetailView: View {
    
    // La vue reçoit un objet ArtDetails.
    // Grâce à "art", on peut afficher :
    // - l'image
    // - le titre
    // - la description
    // - le type
    // - l'auteur
    // - la localisation...
    var art: ArtDetails
    
    var body: some View {
        
        // VStack place les éléments verticalement.
        //
        // Image
        // ↓
        // ScrollView avec les informations
        VStack {
            
            // MARK: - Image principale
            
            // AsyncImage permet de charger une image
            // depuis une URL Internet.
            AsyncImage(
                url: URL(string: art.image)
            ) { image in
                
                // Quand l'image est chargée,
                // on l'affiche.
                image
                    .resizable()
                
            } placeholder: {
                
                // Pendant le chargement de l'image,
                // on affiche un fond gris.
                Color.gray.opacity(0.1)
            }
            
            // Hauteur fixe de l'image.
            .frame(height: 330)
            
            // L'image prend toute la largeur disponible.
            .frame(maxWidth: .infinity)
            
            // Coupe les parties qui dépassent du frame.
            .clipped()
            
            
            // MARK: - Informations
            
            // ScrollView permet de faire défiler
            // les informations vers le haut et vers le bas.
            ScrollView {
                
                // MARK: Titre
                
                // Affiche le titre du street art.
                Text(art.title)
                    .font(.subheadline.bold())
                    .foregroundColor(.orange)
                    
                    // Le texte prend toute la largeur
                    // et reste aligné à gauche.
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    
                    // Espace à gauche et à droite.
                    .padding(.horizontal)
                    
                    // Espace en haut.
                    .padding(.top, 8)
                    
                    // Espace en bas.
                    .padding(.bottom, 6)
                
                
                // MARK: Description
                
                // Affiche la description du street art.
                Text(art.description)
                    .font(.caption)
                    .foregroundColor(.black)
                    
                    // Rend le texte légèrement transparent.
                    .opacity(0.8)
                    
                    // Le texte prend toute la largeur
                    // et reste aligné à gauche.
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    
                    // Permet au texte de prendre plusieurs lignes.
                    .fixedSize(
                        horizontal: false,
                        vertical: true
                    )
                    
                    .padding(.horizontal)
                
                
                // MARK: - Informations supplémentaires
                
                // VStack permet d'afficher les informations
                // les unes sous les autres.
                VStack(
                    alignment: .leading,
                    spacing: 2
                ) {
                    
                    // "Type :" est affiché en gras.
                    // art.type est affiché normalement.
                    Text("Type : ").bold()
                    + Text(art.type)
                    
                    
                    Text("Condition : ").bold()
                    + Text(art.condition)
                    
                    
                    Text("Date : ").bold()
                    + Text(art.date)
                    
                    
                    Text("Auteur : ").bold()
                    + Text(art.Auteur)
                    
                    
                    Text("Localisation : ").bold()
                    + Text(
                        art.Localisation
                            .replacingOccurrences(
                                of: " (",
                                with: "\n("
                            )
                    )
                }
                
                // Taille du texte des informations.
                .font(.caption)
                
                // Prend toute la largeur
                // et reste aligné à gauche.
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                
                .padding(.horizontal)
                .padding(.top, 10)
                .padding(.bottom, 12)
                
                
                // MARK: - Image de localisation
                
                // Cette image vient des Assets de Xcode.
                Image(art.imageLocation)
                    .resizable()
                    
                    // Taille fixe de l'image.
                    .frame(
                        width: 350,
                        height: 200
                    )
                    
                    // Arrondit les coins.
                    .cornerRadius(20)
            }
        }
        
        // La vue ignore les zones de sécurité de l'iPhone.
        // Elle peut donc aller derrière :
        // - la Dynamic Island
        // - la barre du haut
        // - la zone du bas
        .ignoresSafeArea()
    }
}


#Preview {
    
    // Affiche la vue avec le quatrième street art
    // du tableau arts.
    //
    // Le tableau commence à l'index 0 :
    //
    // arts[0] = premier
    // arts[1] = deuxième
    // arts[2] = troisième
    // arts[3] = quatrième
    StreetArtDetailView(art: arts[3])
}
