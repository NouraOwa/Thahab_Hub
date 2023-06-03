//
//  MainPage.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 14/11/1444 AH.
//

import SwiftUI
struct GoldPrice: Codable{
    var price_gram_24k: Double
    var price_gram_21k: Double
    var price_gram_18k: Double
}

struct MainPage: View {
    @State private var price = GoldPrice(price_gram_24k: 0, price_gram_21k: 0, price_gram_18k: 0)
    
    var body: some View {
        VStack{
            HStack{
                Text("Thahab Hub")
                    .font(.subheadline)
                    .bold()
                Image("logo")
                    .resizable()
                    .frame(width: 30, height: 30)
            }.padding(.trailing,230)
            Divider()
            Text("Current Gold Price in Saudi Arabia in (SAR)")
                .padding(.top,30)
                .bold()
                .multilineTextAlignment(.center)
            Group{
                ZStack{
                    Rectangle()
                        .frame(width: 350,height: 200)
                        .foregroundColor(Color.yellow.opacity(0.1))
                        .cornerRadius(20)
                        .shadow(radius: 5)
                    VStack{
                        HStack{
                            Text("Gram Price for 18k: ").bold()
                            Text("\(price.price_gram_18k)")
                        }.padding()
                        HStack{
                            Text("Gram Price for 21k: ").bold()
                            Text("\(price.price_gram_21k)")
                        }.padding()
                        HStack{
                            Text("Gram Price for 24k: ").bold()
                            Text("\(price.price_gram_24k)")
                        }.padding()
                    }
                }
            }
            
            Group{
                Text("To Calculate Your Gold Price, Press the button")
                    .padding(.top, 100)
                
                Button("Calculate"){
                }
                .bold()
                .frame(width: 100, height: 25)
                .background(Color.orange.opacity(0.5))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                Spacer()
                Text("")
            }
        }
        .task {
            await loadData ()
        }
    }
    
    func loadData( ) async {
        do {
            let url = URL(string: "https://www.goldapi.io/api/XAU/SAR")!
            var request = URLRequest(url: url)
            request.setValue("goldapi-1z5tdrligfdev3-io", forHTTPHeaderField: "x-access-token")
            
            let (data, response) = try await URLSession.shared.data(for: request)
            let isSuccessful = isSuccessful(response: response as! HTTPURLResponse)
            print(String(data: data, encoding: .utf8))
            let serverPrice = try JSONDecoder().decode(GoldPrice.self, from: data)
            price = serverPrice
            
        } catch {
            print("error \(error)")
        }
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

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
