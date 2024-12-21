import SwiftUI

struct SearchViewPage: View {
    @State private var search: String = ""
    
    // Use the productList defined in Product.swift
    var filteredProducts: [Product] {
        if search.isEmpty {
            return productList
        } else {
            return productList.filter { $0.name.lowercased().contains(search.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    
                    TextField("Search for products...", text: $search)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 5)
                        .foregroundColor(.black)
                }
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                .padding(.top, 16)
                
                // Search Results
                List(filteredProducts, id: \.id) { product in
                    NavigationLink(destination: ProductDetailsView(product: product)) {
                        HStack {
                            Image(product.image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(product.name)
                                    .font(.headline)
                                Text("BHD \(product.price).00")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(PlainListStyle()) // Modern, clean list style
                
                Spacer()
            }
            .background(Color(red: 0.9, green: 0.95, blue: 1)) // Light blue background
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchViewPage()
}
