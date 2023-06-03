//
//  WelcomeView.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 15/11/1444 AH.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.yellow)
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                VStack{
                    Group{
                        Text("Thahab Hub")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        Text("Welcome to The largest gathering platform\n for gold lovers in the Middle East")
                            .font(.subheadline)
                            .padding(.bottom,40)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .bold()
                        NavigationLink(destination: TabBar()) {
                            Image("logo")
                        }
                    }
                }
            }
        }
    }
}
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
