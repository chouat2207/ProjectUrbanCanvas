//
//  CarteWithDescriptionView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI

struct CarteWithDescriptionView: View {
    @State var isShowing: Bool = false
  //  var artDetails: ArtDetails
    var body: some View {
        Button(action: {isShowing = true})
            {
                //Text("Hi")
                CarteView()
        }
            .sheet(isPresented: $isShowing,
                   content: {
                Text("how")
               // StreetArtDetailView(art: artDetails)
            })
    }
}

#Preview {
    CarteWithDescriptionView()
}
