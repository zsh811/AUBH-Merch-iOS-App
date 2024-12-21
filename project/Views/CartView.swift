import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var selectedPaymentOption: PaymentOption = .card
    @State private var saveCardInfo: Bool = false
    @State private var cardNumber: String = ""
    @State private var expirationDate: String = ""
    @State private var cvv: String = ""
    @State private var isPickup: Bool = true // Default to Pickup
    @State private var deliveryAddress: String = ""
    @State private var couponCode: String = ""
    @State private var discount: Double = 0.0
    @State private var invalidCode: Bool = false // Tracks invalid coupon code

    private var subtotal: Double {
        return Double(cartManager.total)
    }

    private var tax: Double {
        return subtotal * 0.05
    }

    private var total: Double {
        return subtotal + tax - discount
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Cart Header or Products
                if cartManager.products.count > 0 {
                    ForEach(cartManager.products, id: \.id) { product in
                        CartProductView(product: product)
                    }

                    // Subtotal, Tax, and Total
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Subtotal:")
                            Spacer()
                            Text("BHD \(String(format: "%.2f", subtotal))")
                        }

                        HStack {
                            Text("Tax (5%):")
                            Spacer()
                            Text("BHD \(String(format: "%.2f", tax))")
                        }

                        if discount > 0 {
                            HStack {
                                Text("Discount (AUBH20):")
                                Spacer()
                                Text("-BHD \(String(format: "%.2f", discount))")
                                    .foregroundColor(.green)
                            }
                        }

                        Divider()

                        HStack {
                            Text("Total:")
                                .font(.headline)
                            Spacer()
                            Text("BHD \(String(format: "%.2f", total))")
                                .font(.headline)
                                .bold()
                        }
                    }
                    .padding()
                } else {
                    VStack(spacing: 10) {
                        Text("Your Cart is Empty")
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("Explore our amazing AUBH merchandise!\nThere’s something for everyone.")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    .padding(.top, 30)
                }

                // Coupon Code Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Coupon Code")
                        .font(.headline)

                    HStack {
                        TextField("Enter your coupon code", text: $couponCode)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)

                        Button(action: {
                            applyCoupon()
                        }) {
                            Text("Apply")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }

                    if invalidCode {
                        Text("This code is invalid")
                            .foregroundColor(.red)
                            .font(.footnote)
                    }
                }
                .padding()

                // Payment Option Section
                VStack(alignment: .leading, spacing: 15) {
                    Text("Payment Options")
                        .font(.headline)

                    Picker("Select Payment Method", selection: $selectedPaymentOption) {
                        Text("Pay with Card").tag(PaymentOption.card)
                        Text("Apple Pay").tag(PaymentOption.applePay)
                        Text("Cash on Delivery").tag(PaymentOption.cod)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)

                    // Payment Option Forms
                    if selectedPaymentOption == .card {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Card Details")
                                .font(.subheadline)
                                .fontWeight(.bold)

                            TextField("Card Number", text: $cardNumber)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)

                            HStack {
                                TextField("Expiration Date (MM/YY)", text: $expirationDate)
                                    .keyboardType(.numbersAndPunctuation)
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(8)

                                TextField("CVV", text: $cvv)
                                    .keyboardType(.numberPad)
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(8)
                            }

                            Toggle("Save Card Information for Future Purchases", isOn: $saveCardInfo)
                                .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                        }
                    } else if selectedPaymentOption == .applePay {
                        Button(action: {
                            print("Apple Pay selected")
                        }) {
                            HStack {
                                Spacer()
                                Text("Pay with  Pay")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding()
                            .background(Color.black)
                            .cornerRadius(12)
                        }
                    } else if selectedPaymentOption == .cod {
                        Text("You can pay in cash when the order is delivered.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()

                // Pickup or Delivery Section
                VStack(alignment: .leading, spacing: 15) {
                    Text("Pickup or Delivery")
                        .font(.headline)

                    Picker("Choose Option", selection: $isPickup) {
                        Text("Pickup").tag(true)
                        Text("Delivery").tag(false)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)

                    if isPickup {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Pickup Location:")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text("AUBH Student Commons")
                                .foregroundColor(.gray)
                        }
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Delivery Address")
                                .font(.subheadline)
                                .fontWeight(.bold)

                            TextField("Enter your delivery address", text: $deliveryAddress)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()

                // Checkout Button
                Button(action: {
                    print("Proceeding to checkout...")
                }) {
                    Text("Checkout")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }

    private func applyCoupon() {
        if couponCode.uppercased() == "AUBH20" {
            discount = subtotal * 0.2
            invalidCode = false
        } else {
            discount = 0.0
            invalidCode = true
        }
    }
}

enum PaymentOption: String, CaseIterable {
    case card = "Pay with Card"
    case applePay = "Apple Pay"
    case cod = "Cash on Delivery"
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
