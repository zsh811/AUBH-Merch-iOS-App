//
//  ImageSliderView.swift
//  project
//
//  Created by D103-03 on 26/11/2024.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides: [String] = ["pic2","pic3","pic4","pic5","6", "7", "8"]
    
    var body: some View {
        ZStack(alignment: . bottomLeading){
            ZStack(alignment: .trailing){
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width:.infinity, height: 180)
                    .scaledToFit()
                    .cornerRadius(15)
            }
            HStack{
                ForEach(0..<slides.count){index in
                    Circle()
                        .fill(self.currentIndex == index ? Color("kPrimary"): Color("kSecondary"))
                        .frame(width: 10, height: 10)
                    
                }
            }
            .padding()
        }
        .padding()
        .onAppear{
            Timer.scheduledTimer (withTimeInterval: 5, repeats: true){timer in
                if self.currentIndex + 1 == self.slides.count{
                    self.currentIndex = 0
                }else{
                    self.currentIndex += 1
                }
            }
        }
    
    }
}

#Preview {
    ImageSliderView()
}
