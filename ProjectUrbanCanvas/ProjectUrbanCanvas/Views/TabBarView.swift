//
//  TabBarView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI

struct TabBarView: View {
    
    var body: some View {
        TabView {
            StreetArtListView()
                .tabItem {
                    Label("Ouvres", systemImage: "photo.artframe.circle.fill")
                }
            AuteursView()
                .tabItem {
                    Label("Auteurs", systemImage: "person.circle.fill")
                }
        }
        .tint(.orange)
    }

}

#Preview {
    TabBarView()
}
