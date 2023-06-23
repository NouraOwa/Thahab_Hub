//
//  WelcomeView.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 15/11/1444 AH.
//

import SwiftUI

struct WelcomeView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            Color(.white)
            if self.isActive {
                DevTechieCustomTabbar()
            } else {
                Image("logo3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isActive = true
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
