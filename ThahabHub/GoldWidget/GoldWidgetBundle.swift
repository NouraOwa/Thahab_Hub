//
//  GoldWidgetBundle.swift
//  GoldWidget
//
//  Created by Noura Alowayid on 29/11/1444 AH.
//

import SwiftUI
import WidgetKit
import Intents

@main
struct GoldWidgetBundle: WidgetBundle {
    var body: some Widget {
        dailyScheduleWidget.widget
    }
}

let dailyScheduleWidget = AxWidgetDefinition(
    kind: "DailyScheduleWidget",
    displayName: "Current Gold Price in (SAR) ",
    description: "View the Current Gold Price.",
    previewEntry: DefaultWidget(),
    fallbackEntry: DefaultWidget(),
    supportedFamilies: [.systemMedium, .systemLarge],
    view: { _ in WidgetView() }
)

struct DefaultWidget: AxWidgetModel {
    var date = Date()
}

struct GoldPrice: Codable {
    var price_gram_24k: Double
    var price_gram_21k: Double
    var price_gram_22k: Double
    var price_gram_18k: Double
}

struct WidgetView: View {
    @State var prices = GoldPrice(price_gram_24k: 0, price_gram_21k: 0,price_gram_22k: 0, price_gram_18k: 0)
    var body: some View {
        VStack(){
            VStack(spacing: 0){
                Text("Today's Gold Price").bold()
                    .font(.system(size: 17)).padding(.top,7)
                    .bold()
                    .foregroundColor(Color("gold2"))
                    .multilineTextAlignment(.center)
                Text("(SAR)").bold()
                    .font(.system(size: 14)).padding(.bottom, 5)
                    .bold()
                    .foregroundColor(Color("gold2"))
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            .padding(.top)
            Divider()
                .frame(maxHeight: 2)
                .background(Color("gold2"))
            HStack{
                Text("Gram Price for 18k:").bold()
                //Text("\(prices.price_gram_18k, specifier: "%.2f")")
                Text("174.63")
                Divider()
                Text("Gram Price for 21k:").bold()
                //Text("\(prices.price_gram_21k, specifier: "%.2f")")
                Text("203.74")
            }.font(.system(size: 11))
            
            Divider()
                .frame(maxHeight: 2)
                .background(Color("gold2"))
            
            HStack{
                Text("Gram Price for 22k:").bold()
                //Text("\(prices.price_gram_22k, specifier: "%.2f")")
                Text("213.44")
                Divider()
                Text("Gram Price for 24k:").bold()
               // Text("\(prices.price_gram_24k, specifier: "%.2f")")
                Text("232.84")

            }.font(.system(size: 11))
            Spacer()
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
            _ = isSuccessful(response: response as! HTTPURLResponse)
            print(String(data: data, encoding: .utf8))
            let serverPrice = try JSONDecoder().decode(GoldPrice.self, from: data)
            prices = serverPrice
            
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
struct GoldWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
