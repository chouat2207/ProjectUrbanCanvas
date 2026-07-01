//
//  ContentView.swift
//  Urban_Canvas
//
//  Created by Apprenant 77 on 01/07/2026.
//

import SwiftUI

struct ContentView: View {
    @State var listArt = streetsArt[0]
    var body: some View {
        
        NavigationStack {
                    List(streetsArt) { art in
                        NavigationLink {
                        //    StreetArtDetailView(art: art)
                        } label: {
                            StreetArtRow(art: art)
                        }
                    }
                    .navigationTitle("Liste de Street arts")
                }
        }
        
    }


#Preview {
    ContentView()
}
