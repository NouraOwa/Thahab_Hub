//
//  CalculateView.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 15/11/1444 AH.
//

import SwiftUI

struct CalculateView: View {
    @Binding var weight: String
    @Binding var price: GoldPrice
    @State var gold_purity_18K = 0.750
    @State var gold_purity_21K = 0.875
    @State var gold_purity_22K = 0.9167
    @State var gold_purity_24K = 0.999
    @State var sellingPrice: Double = 0
    @State var priceForOneGram: Double = 0
    @State private var result = ""
    @State var selectedKarat = ""
    let karats = ["18K", "21K", "22K", "24K"]

    func SelectedKaratMenu(){
        if selectedKarat == "18K"{
            priceForOneGram = price.price_gram_18k * gold_purity_18K
            print(price.price_gram_18k)
            sellingPrice = priceForOneGram * (Double(weight) ?? 0.0)
            print(sellingPrice)
        } else if selectedKarat == "21K"{
            priceForOneGram = price.price_gram_21k * gold_purity_21K
            print(price.price_gram_21k)
            sellingPrice = priceForOneGram * (Double(weight) ?? 0.0)
            print(sellingPrice)
        } else if selectedKarat == "22K"{
            priceForOneGram = price.price_gram_22k * gold_purity_22K
            print(price.price_gram_22k)
            sellingPrice = priceForOneGram * (Double(weight) ?? 0.0)
            print(sellingPrice)
        } else if selectedKarat == "24K"{
            priceForOneGram = price.price_gram_24k * gold_purity_24K
            print(price.price_gram_24k)
            sellingPrice = priceForOneGram * (Double(weight) ?? 0.0)
            print(sellingPrice)
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                VStack {
                    Text("Thahab Hub")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("gold2"))
                    Divider()
                }
                .frame(maxWidth: .infinity)
                .padding(.top)
                
                Text("Gold Price Calculator")
                    .font(.title3)
                    .padding()
                    .bold()
                Group{
                    List{
                        Section("Weight"){
                            HStack{
                                TextField("Enter Weight in Gram", text: $weight)
                                    .keyboardType(.decimalPad)
                            }.padding()
                        }.listRowBackground(Color.yellow.opacity(0.2))
                                            
                            Section(header: Text("Karat")) {
                                Picker("Select Karat", selection: $selectedKarat) {
                                    ForEach(karats, id: \.self) { karat in
                                        Text(karat)
                                            .foregroundColor(selectedKarat == karat ? .red : .primary)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .padding()
                            }.listRowBackground(Color.yellow.opacity(0.2))
                        
                        .listStyle(.grouped)
                    }
                    
                    VStack{
                        VStack(alignment: .center){
                            Button(action: {
                                SelectedKaratMenu()
                                result = String(sellingPrice)
                                print(result)
                            }, label: {
                                Text("Calculate")
                                    .padding(.vertical, 12)
                                    .frame(maxWidth: .infinity)
                                    .background(Color("gold2"))
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                            }).buttonStyle(.plain)
                            
                            Text("The Fair Selling Price: \(sellingPrice, specifier: "%.2f")").bold()
                        }.padding()
                        NavigationLink(destination: SuggestionView()){
                            Text("Find Suggestion")
                                .buttonStyle(.borderedProminent)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color("gold2"))
                                .font(.system(size: 14))
                                .tint(Color("gold2"))
                        }
                        
                        //Price for one gram * purity = selling price for one gram
                        //selling price for one gram * weight = The Fair Selling Price
                    }
                }
            }
        }.accentColor(.black)
    }
}

