import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var cartManager: CartManager

    var column = [GridItem(.adaptive(minimum: 160), spacing: 20)]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        NavigationLink(destination: ProductDetailsView(product: product)) {
                            ProductCardView(product: product)
                                .environmentObject(cartManager)
                        }
                        .buttonStyle(PlainButtonStyle()) // Removes default NavigationLink styling
                    }
                }
                .padding()
            }
            .navigationTitle("Products") // Title for the navigation bar
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(CartManager())
    }
}
