//
//  AboutUs.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 02/12/1444 AH.
//

import SwiftUI

struct AboutUs: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                VStack {
                    Text("Thahab Hub")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("gold2"))
                    Divider()
                }
                .frame(maxWidth: .infinity)
                .padding(.top)
                
                Text("About Us")
                    .padding()
                    .font(.title3)
                    .bold()
                VStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color("gold")).opacity(0.2)
                        .frame(height: 280)
                        .overlay {
                            VStack{
                                HStack{
                                    Text("Thahab Hub").font(.body).bold()
                                    Text("Is an application that ").font(.body)}
                                Text("provides services to gold collectors, such as dashboard that displays real-time gold prices and calculate the fair price for selling based on the user input of number of grams and karat, and the application gives  a suggestion to buy gold jewelry from more than one store. Also included ring size calculator to help user find their right size.").font(.body)
                            }.padding()
                        }
                }.padding()
                VStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color("gold")).opacity(0.2)
                        .frame(height: 180)
                        .overlay {
                            VStack{
                                Text("Do You have a Gold Store?").font(.body).bold()
                                
                                Text("You can Contact us via this Email to suggest your store to the users: ").font(.body)
                                    .padding(.bottom)
                                HStack{
                                    Image(systemName: "message.circle.fill")
                                        .resizable()
                                        .foregroundColor(Color("gold2"))
                                        .frame(width:20, height: 20)
                                    Text("ThahabHub@info.com")
                                }
                            }.padding()
                        }
                }.padding()
                Spacer()
            }
        }
    }
}
struct AboutUs_Previews: PreviewProvider {
    static var previews: some View {
        AboutUs()
    }
}
