//
//  TabBar.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI

struct PickerView: View {
   // @Binding  var pickerSelection = Content
    @Binding  var selection: Content
    //@Binding var selection : COntent 
    init(selection: Binding<Content>) {
            self._selection = selection
    
            UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(
                red: 1.0,
                green: 0.58,
                blue: 0.28,
                alpha: 1.0
            )
            UISegmentedControl.appearance().setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .selected
            )
    
            UISegmentedControl.appearance().setTitleTextAttributes(
                [.foregroundColor: UIColor.black],
                for: .normal
            )
        }
     enum Content : String,CaseIterable {
        case liste = "Liste"
        case carte = "Carte"
        var id: Self { self }
    }
    
    var body: some View {
        Picker("", selection: $selection){
                ForEach(Content.allCases, id: \.self){ content in
                    Text(content.rawValue)
                        .tag(content)
                    
                }
        }
            .pickerStyle(SegmentedPickerStyle())
            //.background(Color.white)
            .padding()
        
    }}

#Preview {
    PickerView(selection: .constant(.liste))
}

