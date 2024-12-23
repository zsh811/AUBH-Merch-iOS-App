import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        ZStack {
            Color("kSecondary")

            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    // Product Image
                    Image(product.image)
                        .resizable()
                        .frame(width: 175, height: 160)
                        .cornerRadius(12)
                    
                    // Product Name
                    Text(product.name)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical, 1)
                    
                    // Product Price
                    Text("BHD \(product.price)")
                        .foregroundColor(.black)
                        .bold()
                }
                .padding()
                // Plus Button
                Button {
                    cartManager.addToCart(product: product)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color("kPrimary"))
                        .frame(width: 35, height: 35)
                        .padding(.trailing)
                }
            }
        }
        .frame(width: 185, height: 260)
        .cornerRadius(15)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: productList[0])
            .environmentObject(CartManager())
    }
}
