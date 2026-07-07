//
//  StreetsArts.swift
//  Urban_Canvas
//
//  Created by Apprenant 77 on 01/07/2026.
//

import Foundation
struct StreetsArts: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var image: String
}

var streetsArt :[StreetsArts] = [
    StreetsArts(title: "Liberté Égalité Fraternité", description: "Paris", image: "https://streetartcities.com/media/7/7bb12e51-88fe-47f2-ae3a-a0404dc91825/orig.jpg"),
        
    StreetsArts(title: "La Joconde de Marseille", description: "Marseille", image: "https://streetartcities-production-media.s3-accelerate.amazonaws.com/media/c/ce6614db-377d-4632-9930-c81d76b040b3/orig.jpg"),
        
    StreetsArts(title: "La maison de Cécile", description: "Paris", image: "https://streetartcities.com/media/a/a921c9a5-b3de-4d0c-9ba0-b778236d4bd4/orig.jpg"),
        
    StreetsArts(title: "Chloé", description: "Marseille", image: "https://streetartcities.com/media/d/deb1803f-a156-4f3f-9c72-41481e34feac/orig.jpg"),
        
    StreetsArts(title: "PA_78", description: "Paris", image: "https://streetartcities.com/media/7/74d2ab88-609d-4ba4-95b7-0df7253130ca/orig.jpg"),
        
    StreetsArts(title: "Chuuuut...", description: "Paris", image: "https://streetartcities.com/media/9/9fd23099-7863-4f9f-96a7-0a81fed82ddc/orig.jpg"),
        
    StreetsArts(title: "Le Tigre et la Cigale", description: "Marseille", image: "https://streetart.media/6/625f547c-d7e2-458b-a01b-6d29dc364b0a/orig.jpg")
        
    ]


