//
//  TabBar.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI

struct PickerView: View {
    @State private var pickerSelection = Content.liste
    private enum Content : String,CaseIterable {
        case liste = "Liste"
        case carte = "Carte"
        var id: Self { self }
    }
    
    var body: some View {
        Picker("", selection: $pickerSelection){
                ForEach(Content.allCases, id: \.self){ content in
                    Text(content.rawValue)
                    
                }
        }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        
    }}

#Preview {
    PickerView()
}




