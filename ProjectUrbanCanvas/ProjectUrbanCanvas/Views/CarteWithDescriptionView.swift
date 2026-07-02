//
//  CarteWithDescriptionView.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 02/07/2026.
//

import SwiftUI

struct CarteWithDescriptionView: View {
    @State var isShowing: Bool = false
    var body: some View {
        Button(action: {isShowing = true})
            {
                Text("Hi")
        }
            .sheet(isPresented: $isShowing,
                   content: {
                Text("how")
            })
    }
}

#Preview {
    CarteWithDescriptionView()
}
