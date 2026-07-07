//
//  Auteurs.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import Foundation
struct Auteurs : Identifiable {
    var id = UUID()
    var nom : String
    var image : String
    var origins : String
    var age : String
    var style : String
}
var auteurs : [Auteurs] = [
    Auteurs(nom: "Kan DMV", image: "https://madeinmarseille.net/actualites-marseille/joconde-kan-dmv-fresque-saint-mauront.jpg", origins: "France", age: "49", style: "Pointilisme"),
    Auteurs(nom: "Kitsune Jolene", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsAmotfIHGiukiUDfObrTL3J-JEzQxdzmgCHjsH_gZ2KZg3lz3N6XHwZpt&s=10", origins: "Belgique", age: "34", style: "Mural"),
    Auteurs(nom: "Aero", image: "https://www.trompe-l-oeil.info/street-art/Goldenstreetart/aero-portrait2.jpg", origins: "France", age: "NC", style: "Aerographie"),
    Auteurs(nom: "Seth Globepainter", image: "https://www.lezarts-bievre.com/wp-content/uploads/2018/04/Seth-2018-8329-low.jpg", origins: "France", age: "54", style: "Glopepainter"),
    Auteurs(nom: "JDL", image: "https://cdn-s-www.vosgesmatin.fr/images/B22E0903-A131-4AB1-A1D5-C979183BEEBA/NW_raw/l-artiste-neerlandaise-jdl-s-empare-du-mur-avec-une-nouvelle-creation-qui-sera-inauguree-ce-vendredi-8-mars-(photo-s-l-)-1551896613.jpg", origins: "Pays-Bas", age: "30", style: "Mural"),
    Auteurs(nom: "Shepard Fairy", image: "https://upload.wikimedia.org/wikipedia/commons/8/83/Shepard-fairey-2011-westhollywood.jpg", origins: "USA", age: "65", style: "Mural")
]
