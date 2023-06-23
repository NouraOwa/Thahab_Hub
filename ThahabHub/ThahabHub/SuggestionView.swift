//
//  SuggestionView.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 02/12/1444 AH.
//

import SwiftUI

struct SuggestionView: View {
    @State private var selectedCategory: String?
    let categories = ["All", "Bracelets", "Rings", "Earrings", "Necklaces"]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
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
                
                VStack(alignment: .leading) {
                    Text("Suggestion for you")
                        .font(.title3)
                        .bold()
                        .padding(.leading)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                withAnimation(.spring()) {
                                    selectedCategory = category
                                }
                            }) {
                                Text(category)
                                    .font(.caption)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(selectedCategory == category ? Color("gold2") : Color("gold").opacity(0.1))
                                    .cornerRadius(20)
                            }
                            .buttonStyle(.bordered)
                            .tint(Color("gold"))
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color("gold"), lineWidth: 2)
                            )
                        }
                    }
                    .padding()
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(allSuggestion, id: \.id) { suggest in
                            if selectedCategory == nil || selectedCategory == "All" || selectedCategory == suggest.category {
                                VStack {
                                    RoundedRectangle(cornerRadius: 40)
                                        .fill(Color.gray)
                                        .opacity(0.2)
                                        .frame(width: 160, height:180)
                                        .overlay {
                                            Image(suggest.itemImage)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 160, height: 180)
                                                .cornerRadius(40)
                                                .clipped()
                                        }.padding()
                                        .scaleEffect(selectedCategory == suggest.category ? 1.1 : 1)
                                        .animation(.easeInOut(duration: 0.2), value: selectedCategory)
                                    
                                    Text(suggest.itemTitle)
                                        .font(.caption)
                                        .bold()
                                    
                                    Text("\(suggest.itemPrice, specifier: "%.2f") SAR")
                                        .font(.caption)
                                    
                                    Button(action: {
                                        if let url = URL(string: suggest.itemLink), UIApplication.shared.canOpenURL(url) {
                                            UIApplication.shared.open(url)
                                        }
                                    }, label: {
                                        Text("Visit")
                                            .frame(width: 100)
                                    })
                                    .buttonStyle(.bordered)
                                    .border(Color("gold"), width: 2)
                                    .cornerRadius(4)
                                    .tint(Color("gold"))
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .frame(width: 100)
                                    .padding(.bottom)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }.navigationTitle("Suggestion for you")
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView()
    }
}
