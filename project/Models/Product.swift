//
//  Product.swift
//  project
//
//  Created by D103-03 on 26/11/2024.
//

import Foundation

struct Product: Identifiable{
    
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var supplier: String
    var price: Int
    var width: String
    var height: String
    var diameter: String
    
}

var productList = [

    Product(name: "AUBH Shield Sleeve",
            image: "Pic1",
            description: "Protect your laptop in style with the AUBH Laptop Sleeve, a sleek and durable case designed for students and professionals who take pride in being part of the American University of Bahrain (AUBH) community. Featuring the bold AUBH logo and the elegant 'Riffa' motif, this laptop sleeve is not only functional but also showcases your school spirit wherever you go. \n\nMaterial: \nHigh-quality neoprene fabric, providing a soft yet sturdy exterior that cushions your laptop against scratches, dust, and minor impacts. \n\nCompatibility: \nFits most 13- to 15-inch laptops snugly. \n\nClosure: \nSmooth and secure zip closure to ensure your device stays protected. Lightweight Design: Easy to carry on its own or slide into your backpack for added convenience.",
            supplier: "Bahrain Custom Prints",
            price: 8,
    width: "35 cm",
    height: "25 cm",
    diameter: "2 cm"),
    
    
//    //Product Description: Show your school spirit with the AUBH Classic T-Shirt, designed for comfort and style. Featuring the American University of Bahrain (AUBH) logo prominently on the front, along with "Riffa" and "EST. 2019," this vibrant royal blue t-shirt is perfect for students, alumni, and fans of AUBH. Its timeless design and premium material make it ideal for casual wear, campus events, or as a standout addition to your wardrobe.
//    
//    Features:
//
//    Material: Soft, breathable, and durable cotton blend, perfect for all-day wear.
//    Fit: Regular fit with short sleeves and a classic crew neck for maximum comfort.
//    Design:
//    Front: The iconic AUBH logo in white, accompanied by "Riffa" and "EST. 2019."
//    Back: Plain royal blue for a clean, minimalist look.
//    Available Sizes: XS, S, M, L, XL, XXL.
//    Care Instructions: Machine washable and fade-resistant to retain its vibrant color and design.
//    Price:
//    Available for 6 BHD.
//
//    Potential Supplier:
//    Sourced from Bahrain Apparel Supplies or Gulf Uniforms, both specializing in custom-branded apparel for institutions.
//
//    Catchy Name:
//    The AUBH Spirit Tee
//
//    Wear the AUBH Classic T-Shirt with pride and showcase your connection to the American University of Bahrain in style and comfort! Perfect for every occasion, whether you're attending a class, a university event, or simply hanging out with friends.
    
    Product(name: "The AUBH Spirit Tee",
            image: "pic2",
            description: "Show your school spirit with the AUBH Classic T-Shirt, designed for comfort and style. Featuring the American University of Bahrain (AUBH) logo prominently on the front, along with 'Riffa' and 'EST. 2019,' this vibrant royal blue t-shirt is perfect for students, alumni, and fans of AUBH. Its timeless design and premium material make it ideal for casual wear, campus events, or as a standout addition to your wardrobe.\n\n Material: \nSoft, breathable, and durable cotton blend, perfect for all-day wear. \n\n Fit: \n Regular fit with short sleeves and a classic crew neck for maximum comfort.\n\nCare Instructions: \nMachine washable and fade-resistant to retain its vibrant color and design.",
            supplier: "Bahrain Apparel Supplies",
            price: 6,
            width: "none",
            height: "none",
            diameter: "none"),
    
    Product(name: "The AUBH Legacy Tee",
            image: "pic3",
            description: "Show your school spirit with the AUBH Graduation Class Tee, a must-have for the Class of 2028 and any other graduating class (Customizable). Featuring the American University of Bahrain (AUBH) logo prominently on the front along with 'Riffa,' and a bold 'Class of 2028' design on the back, this vibrant royal blue t-shirt is the perfect way to commemorate your achievements. Its premium material and stylish design make it ideal for campus events, graduation celebrations, or as a keepsake of your memorable journey. \n\nMaterial:\nSoft, breathable, and durable cotton blend, providing comfort for all-day wear. \n\nFit: \nRegular fit with short sleeves and a round neckline, offering a relaxed yet polished look. \n\nCare Instructions:\nMachine washable and fade-resistant, ensuring the design stays vibrant and the fabric remains fresh over time.",
            supplier: "Bahrain Apparel Supplies",
            price: 7,
            width: "none",
            height: "none",
            diameter: "none"),
    
    Product(name: "AUBH Water Bottle",
            image: "pic4",
            description: "A stylish and durable water bottle designed to keep your drinks hot or cold. Perfect for on-the-go hydration with a sleek design.",
            supplier: "AUBH",
            price: 25,
            width: "7 cm",
            height: "25 cm",
            diameter: "7 cm"),
    
    Product(name: "AUBH Tumbler",
            image: "pic5",
            description: "A double-walled tumbler featuring a stylish design, perfect for keeping your beverages hot or cold. Ideal for both indoor and outdoor use.",
            supplier: "AUBHfaubhi",
            price: 15,
            width: "8 cm",
            height: "12 cm",
            diameter: "8 cm"),
    
    Product(name: "AUBH Polo Shirt",
            image: "6",
            description: "A comfortable and stylish polo shirt featuring the AUBH logo. Perfect for casual wear or university events.",
            supplier: "AUBH",
            price: 30,
            width: "50 cm",
            height: "70 cm",
            diameter: "N/A"),
    
    Product(name: "AUBH Blue Tote Bag",
            image: "7",
            description: "A spacious and durable tote bag featuring motivational text and the AUBH logo. Perfect for daily use and carrying essentials.",
            supplier: "AUBH",
            price: 20,
            width: "40 cm",
            height: "35 cm",
            diameter: "N/A"),
    
    Product(name: "AUBH Red Tote Bag",
            image: "8",
            description: "A vibrant red tote bag featuring inspirational text and the AUBH logo. Ideal for carrying everyday items with style.",
            supplier: "AUBH",
            price: 20,
            width: "40 cm",
            height: "35 cm",
            diameter: "N/A"),
    
    Product(name: "AUBH Sticker Pack",
            image: "9",
            description: "A collection of vibrant stickers featuring motivational messages and the AUBH logo, perfect for personalizing your belongings.",
            supplier: "AUBH",
            price: 10,
            width: "N/A",
            height: "N/A",
            diameter: "N/A"),
    
    Product(name: "AUBH Baseball Cap",
            image: "10",
            description: "A stylish baseball cap available in two colors, featuring the AUBH logo and a unique design. Perfect for casual outings.",
            supplier: "AUBH",
            price: 15,
            width: "N/A",
            height: "N/A",
            diameter: "N/A"),
    
    

]
