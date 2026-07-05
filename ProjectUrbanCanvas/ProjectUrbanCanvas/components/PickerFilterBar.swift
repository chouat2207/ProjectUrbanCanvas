//
//  PickerFilterBar.swift
//  ProjectUrbanCanvas
//
//  Created by Apprenant 77 on 03/07/2026.
//

import SwiftUI

struct PickerFilterBar: View {
    @Binding var selection: PickerView.Content
    @Binding var showFilters: Bool
    
    var body: some View {
        HStack {
            PickerView(selection: $selection)
                .frame(maxWidth: .infinity)
            
            Button {
                showFilters = true
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
       // .padding(.top, 50)
    }
}

#Preview {
    PickerFilterBar(
        selection: .constant(.liste),
        showFilters: .constant(false)
    )
}
