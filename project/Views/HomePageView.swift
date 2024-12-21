import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager: CartManager

    // Grid Layout for Products
    let columns = [GridItem(.adaptive(minimum: 160), spacing: 16)]

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.white
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    AppBar()
                    ImageSliderView()

                    HStack {
                        Text("Available Merchandise")
                            .font(.title2)
                            .fontWeight(.medium)

                        Spacer()

                        NavigationLink(destination: {
                            ProductsView()
                        }, label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(Color("kPrimary"))
                        })
                    }
                    .padding(.horizontal)

                    // Informational Line and Text
                    Divider()
                        .background(Color.gray.opacity(0.5))
                        .padding(.horizontal)

                    Text("Tap the four-dot icon to explore the full range of AUBH merchandise.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 8)

                    // Product Grid for Multiple Rows
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(productList, id: \.id) { product in
                                NavigationLink {
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .environmentObject(cartManager)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(CartManager())
    }
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "location.north.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)

                Text("Awali, Bahrain")
                    .font(.title2)
                    .foregroundColor(.gray)

                Spacer()

                NavigationLink(destination: CartView().environmentObject(cartManager)) {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }

            Text("Find The Most AUBH")
                .font(.largeTitle)

            Text("MERCHANDISE")
                .font(.largeTitle.bold())
                .foregroundColor(Color("kPrimary"))
        }
        .padding()
    }
}
