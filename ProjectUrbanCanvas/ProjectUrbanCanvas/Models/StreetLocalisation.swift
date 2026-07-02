//
//  StreetLocalisation.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import Foundation
struct StreetLocalisation : Identifiable {
    var id =  UUID()
    var nameStreet: String
    var Latitude: Double
    var Longitude: Double
}

var streetLocalisations : [StreetLocalisation] = [
    StreetLocalisation(nameStreet: "Liberté Égalité Fraternité", Latitude: 48.8958, Longitude: 2.3721),
    StreetLocalisation(nameStreet: "La Joconde de Marseille", Latitude: 43.2964, Longitude: 5.3754),
    StreetLocalisation(nameStreet: "La maison de Cécile", Latitude: 48.9134, Longitude: 2.3584),
    StreetLocalisation(nameStreet: "Chloé", Latitude: 43.31124, Longitude: 5.39063), 
    StreetLocalisation(nameStreet: "PA_78", Latitude: 48.9431, Longitude: 2.4150),
    StreetLocalisation(nameStreet: "Chuuuut...", Latitude: 48.8639, Longitude: 2.3515),
    StreetLocalisation(nameStreet: "Le Tigre et la Cigale", Latitude: 44.3712, Longitude: 4.0862),
]
