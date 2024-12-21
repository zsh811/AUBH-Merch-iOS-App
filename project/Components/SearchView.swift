//
//  SearchView.swift
//  project
//
//  Created by D103-03 on 26/11/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                
                TextField("Search For AUBH Merch", text: $search)
                    .padding()
            }
            .background(Color("kSecondary"))
            .cornerRadius(12)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color("kPrimary"))
                .cornerRadius(12)
            
            
        }
            .padding(.horizontal)
       
        
    }
}

#Preview {
    SearchView()
}
