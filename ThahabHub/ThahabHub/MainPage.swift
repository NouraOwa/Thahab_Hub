//
//  MainPage.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 14/11/1444 AH.
//

import SwiftUI
struct GoldPrice: Codable {
    var price_gram_24k: Double
    var price_gram_21k: Double
    var price_gram_22k: Double
    var price_gram_18k: Double
}

struct MainPage: View {
    @State private var showingSheet = false
    @State var weight: String = ""
    @State var price = GoldPrice(price_gram_24k: 0, price_gram_21k: 0,price_gram_22k: 0, price_gram_18k: 0)
    var body: some View {
        NavigationView{
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
                Text("Current Gold Price in (SAR)")
                    .font(.title3)
                    .padding()
                    .bold()
                Group{
                    List{
                        Section("Gram Price for 18k: "){
                            HStack{
                                Text("\(price.price_gram_18k, specifier: "%.2f")")
                                    .multilineTextAlignment(.center)
                            }.padding(.horizontal)
                                .padding(.vertical, 10)
                        }.listRowBackground(Color.yellow.opacity(0.2))
                        
                        Section("Gram Price for 21k: "){
                            HStack{
                                Text("\(price.price_gram_21k, specifier: "%.2f")")
                            }.padding(.horizontal)
                                .padding(.vertical, 10)
                        }.listRowBackground(Color.yellow.opacity(0.2))
                        
                        
                        Section("Gram Price for 22k: "){
                            HStack{
                                Text("\(price.price_gram_22k, specifier: "%.2f")")
                            }.padding(.horizontal)
                                .padding(.vertical, 10)
                        }.listRowBackground(Color.yellow.opacity(0.2))
                        Section("Gram Price for 24k: "){
                            HStack{
                                Text("\(price.price_gram_24k, specifier: "%.2f")")
                            }.padding(.horizontal)
                                .padding(.vertical, 10)
                        }.listRowBackground(Color.yellow.opacity(0.2))
                        
                        Button(action: {
                            showingSheet.toggle()
                        }) {
                            HStack(spacing: 8) {
                                Text("Gold Price Calculator ")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Image(systemName: "arrow.right")
                                    .font(.callout)
                            }
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity)
                            .background(Color("gold2"))
                            .cornerRadius(8)
                            .shadow(radius: 2)
                        }
                        .buttonStyle(.plain)
                        .sheet(isPresented: $showingSheet) {
                            CalculateView(weight: $weight, price: $price)
                                .preferredColorScheme(.light)
                        }.padding()
                    
                }.scrollContentBackground(.hidden)
                }
            }
            .task {
                await loadData ()
            }
        }.accentColor(.black)
    }
    
    func loadData( ) async {
        do {
            let url = URL(string: "https://www.goldapi.io/api/XAU/SAR")!
            var request = URLRequest(url: url)
            request.setValue("goldapi-1z5tdrligfdev3-io", forHTTPHeaderField: "x-access-token")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            _ = isSuccessful(response: response as! HTTPURLResponse)
            print(String(data: data, encoding: .utf8))
            let serverPrice = try JSONDecoder().decode(GoldPrice.self, from: data)
            price = serverPrice
            
        } catch {
            print("error \(error)")
        }
    }
    
    func isSuccessful(response: HTTPURLResponse) -> Bool {
        guard response.statusCode >= 200 && response.statusCode < 300 else {
            print("Status code is not in the 200s")
            return false
        }
        print("Status code is in the 200s")
        return true
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
