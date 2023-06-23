//
//  RingSize.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 02/12/1444 AH.
//

import SwiftUI

struct RingSize: View {
    @State private var diameter: Double = 15.0 
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack {
                    Text("Thahab Hub")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("gold2"))
                    Divider()
                }
                .frame(maxWidth: .infinity)
                .padding(.top)
                
                Text("Ring Size Calculator")
                    .padding()
                    .font(.title3)
                    .bold()
                Spacer()
                VStack {
                    ZStack{
                        Image("grid")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .clipShape(Circle())
                        Circle()
                            .stroke(lineWidth: 6)
                            .foregroundColor(Color("gold2"))
                            .frame(width: CGFloat(diameter * 10), height: CGFloat(diameter * 10))
                            .padding()
                    }
                    Slider(value: $diameter, in: 8...25, step: 0.1)
                        .accentColor(Color("gold2"))
                        .padding()
                    VStack(alignment: .leading){
                        Text("Inner Diameter: \(diameter, specifier: "%.1f") mm")
                            .font(.headline)
                            .padding()
                        Divider()
                        Text("Circumference: \(diameter * Double.pi, specifier: "%.1f") mm")
                            .font(.headline)
                            .padding()
                        Spacer()
                    }
                }
            }
        }
    }
}


struct RingSize_Previews: PreviewProvider {
    static var previews: some View {
        RingSize()
    }
}

