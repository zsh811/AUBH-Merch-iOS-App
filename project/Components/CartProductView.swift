import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    @State private var quantity: Int = 1

    var body: some View {
        HStack(spacing: 15) {
            // Product Image
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 2)

            // Product Details
            VStack(alignment: .leading, spacing: 8) {
                Text(product.name)
                    .font(.headline)
                    .lineLimit(1)
                    .foregroundColor(.black)

                Text("BD \(String(format: "%.2f", Double(product.price)))")
                    .font(.subheadline)
                    .foregroundColor(.pink)
                    .bold()

                // Quantity Selector
                HStack {
                    Button(action: {
                        if quantity > 1 { quantity -= 1 }
                    }) {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                    }

                    Text("\(quantity)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(minWidth: 30, alignment: .center)

                    Button(action: {
                        quantity += 1
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.title2)
                    }
                }
            }
            Spacer()

            // Trash Button
            Button(action: {
                cartManager.removeFromCart(product: product)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.white)
                    .font(.title2)
                    .padding(8)
                    .background(Color.red)
                    .clipShape(Circle())
                    .shadow(color: Color.red.opacity(0.3), radius: 5, x: 0, y: 2)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        CartProductView(product: productList[2])
            .environmentObject(CartManager())
    }
}
