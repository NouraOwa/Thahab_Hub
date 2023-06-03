//
//  CalculateView.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 15/11/1444 AH.
//

import SwiftUI

struct CalculateView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Thahab Hub")
                    .font(.subheadline)
                    .bold()
                Image("logo")
                    .resizable()
                    .frame(width: 30, height: 30)
            }.padding(.trailing,230)
            
            Divider()
            Text("Enter The Gram of Gold to calculate the estimated price")
                .padding(.top,30)
                .bold()
            HStack{
                TextField("Enter", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(width: 90, height: 25)
                    .frame(maxWidth: .infinity)
                Button("Calculate"){
                }
                .bold()
                .frame(width: 100, height: 25)
                .background(Color.orange.opacity(0.5))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
                Spacer()
            }
            Spacer()
        }.padding()
    }
}
struct CalculateView_Previews: PreviewProvider {
    static var previews: some View {
        CalculateView()
    }
}
