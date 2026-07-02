//
//  Art.swift
//  Urban_Canvas
//
//  Created by Apprenant 77 on 01/07/2026.
//

import Foundation
struct ArtDetails : Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var image: String
    var type : String
    var condition : String
    var date : String
    var Auteur : String
    var Localisation : String
    var imageLocation : String
    
}
var arts : [ArtDetails] = [
    ArtDetails(title: "Liberté Égalité Fraternité", description: "El Seed revient à Paris avec une œuvre puissante et engagée, visible depuis la rue Jeanne d'Arc. Fidèle à son langage singulier — le calligraffiti — l’artiste franco-tunisien, aujourd’hui reconnu à l’international, a marqué de nombreuses villes à travers le monde par ses fresques monumentales. Il avait déjà laissé une empreinte mémorable dans le 13e arrondissement lors de l'aventure de la Tour Paris 13.", image: "https://streetartcities.com/media/7/7bb12e51-88fe-47f2-ae3a-a0404dc91825/orig.jpg",
        type: "Invaders", condition: "trés bonne", date: "Avril 2025", Auteur: "calligraffiti", Localisation: "Water tap, Square Gustave Mesureur, 105 Rue Jeanne d'Arc, 75013 Paris (Latitude : 48.8958, longitude : 2.3721)",imageLocation : "Liberté Égalité Fraternité"),
    
    ArtDetails(title: "La Joconde de Marseille", description: "Dans le cadre de l’exposition « La Joconde, exposition immersive » au Palais de la Bourse à Marseille, coproduite par le Grand Palais Immersif et le Musée du Louvre, le MauMA : Musée des arts urbains de MArseille a donné « carte blanche » à l’artiste Kan / DMV pour la réalisation de l’œuvre « La Joconde de Marseille ». Produite et coordonnée par Méta 2, elle est la première représentation urbaine de la célèbre Monna Lisa au sein de la cité phocéenne.", image: "https://streetartcities-production-media.s3-accelerate.amazonaws.com/media/c/ce6614db-377d-4632-9930-c81d76b040b3/orig.jpg",
        type: "Mural", condition: "Bonne", date: "Mars 2022", Auteur: "Kan DMV", Localisation: "Palais de la Bourse , 13001 Marseille (Latitude : 43.2964, longitude : 5.3754)",imageLocation : "La Joconde de Marseille"),
    
    ArtDetails(title: "La maison de Cécile", description: "The last of the huge murals painted by Seth in an iconic district of Paris. ", image: "https://streetartcities.com/media/a/a921c9a5-b3de-4d0c-9ba0-b778236d4bd4/orig.jpg",
        type: "Stencil", condition: "Bonne", date: "Juillet 2021", Auteur: "Julien-Seth-Malland", Localisation: "Blink, 75 Gal Mouffetard Monge, 75005 Paris (Latitude : 48.9134, longitude : 2.3584)",imageLocation : "La maison de Cécile "),
    
    ArtDetails(title: "Chloé", description: "this is the Portrait of Chloé, a famous skateboarder from Marseille; It was painted at La Friche Belle de Mai, a cultural center, above the skatepark", image: "https://streetartcities.com/media/d/deb1803f-a156-4f3f-9c72-41481e34feac/orig.jpg",
        type: "Calligraphie", condition: "String", date: "December 2020", Auteur: "Julien-Seth-Malland", Localisation: "Friche la Belle de Mai, 41 Rue Jobin, 13003 Marseille (Latitude : 43.31124, longitude : 5.39063)",imageLocation : "Chloé"),
    
    ArtDetails(title: "PA_78", description: "EDans le cadre de l’exposition « La Joconde, exposition immersive » au Palais de la Bourse à Marseille, coproduite par le Grand Palais Immersif et le Musée du Louvre, le MauMA : Musée des arts urbains de MArseille a donné « carte blanche » à l’artiste Kan / DMV pour la réalisation de l’œuvre « La Joconde de Marseille ». Produite et coordonnée par Méta 2, elle est la première représentation urbaine de la célèbre Monna Lisa au sein de la cité phocéenne.", image: "https://streetartcities.com/media/7/74d2ab88-609d-4ba4-95b7-0df7253130ca/orig.jpg",
        type: "Mosaïques", condition: "String", date: "Mars 2022", Auteur: "Kan DMV", Localisation: "53 Rue des Maraîchers, 75020 Paris (Latitude : 48.9431, longitude : 2.4150)",imageLocation : "PA_278"),
    
    ArtDetails(title: "Chuuuut...", description: "Two very famous murals  side by side in Paris.  (Now they are three with the new huge piece left by Invader).The first one is a self portrait by Jef Aerosol.The second one currated by Galerie Itinerrance was painted by Shepard Fairey aka Obey.", image: "https://streetartcities.com/media/9/9fd23099-7863-4f9f-96a7-0a81fed82ddc/orig.jpg",
        type: "Mural", condition: "String", date: "Mars 2022", Auteur: "Kan DMV", Localisation: "Place Igor Stravinsky, 2 Rue Brisemiche, 75004 Paris(Latitude : 48.8639, longitude : 2.3515)",imageLocation : "Chuuut..."),
    
    ArtDetails(title: "Le Tigre et la Cigale", description: "Brésilien résident à Marseille, Nhobi est particulièrement habité par la forêt et les esprits qui la peuplent. Il réalise des fresques où la faune et la végétation sont omniprésentes. Sa fresque fait référence à la dévastation forestière et particulièrement à la forêt amazonienne qui brûle.", image: "https://streetart.media/6/625f547c-d7e2-458b-a01b-6d29dc364b0a/orig.jpg",
        type: "Calligraphie", condition: "String", date: "Mars 2022", Auteur: "Kan DMV", Localisation: "175 Rue du Portail de Fer, 30160 Bessèges (Latitude : 44.3712, longitude : 4.0862)",imageLocation : "Le Tigre et la Cigale"),
]



