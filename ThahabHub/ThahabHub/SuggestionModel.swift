//
//  SuggestionModel.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 02/12/1444 AH.
//

import Foundation
struct Suggestion: Identifiable {
    let id = UUID()
    let itemImage: String
    let itemTitle: String
    let itemPrice: Double
    let itemLink: String
    let category: String
}

let allSuggestion = [
    Suggestion(itemImage: "suggest1", itemTitle: "Gold Bracelet", itemPrice: 2727.77, itemLink: "https://khazenati.com/QPZvZo", category: "Bracelets"),
    Suggestion(itemImage: "suggest2", itemTitle: "Diamond Ring", itemPrice: 822.43, itemLink: "https://khazenati.com/YnKjyZ", category: "Rings"),
    Suggestion(itemImage: "suggest3", itemTitle: "Gold Earrings", itemPrice: 603.83, itemLink: "https://navajewellery.sa/ar/PRGwON", category: "Earrings"),
    Suggestion(itemImage: "suggest4", itemTitle: "Pearl Necklace", itemPrice: 514.37, itemLink: "https://navajewellery.sa/ar/RAKyRXO", category: "Necklaces"),
    Suggestion(itemImage: "suggest5", itemTitle: "Gold Ring", itemPrice: 514.37, itemLink: "https://khazenati.com/qAPKGO", category: "Rings"),
    Suggestion(itemImage: "suggest6", itemTitle: "Gold Bracelet", itemPrice: 1523.04, itemLink: "https://khazenati.com/blmvBP", category: "Bracelets"),
    Suggestion(itemImage: "suggest7", itemTitle: "Diamond Earrings", itemPrice: 2450.01, itemLink: "https://navajewellery.sa/ar/YnAXEp", category: "Earrings"),
    Suggestion(itemImage: "suggest11", itemTitle: "Gold Bracelet", itemPrice: 836.01, itemLink: "https://navajewellery.sa/ar/OgVrAw", category: "Bracelets"),
    Suggestion(itemImage: "suggest17", itemTitle: "Gold Earrings", itemPrice: 780.01, itemLink: "https://navajewellery.sa/ar/BrXQgYn", category: "Earrings"),
    Suggestion(itemImage: "suggest9", itemTitle: "Gold Ring", itemPrice: 1330.01, itemLink: "https://navajewellery.sa/ar/nExXEQv", category: "Rings"),
    Suggestion(itemImage: "suggest14", itemTitle: "Gold Necklace", itemPrice: 627.35, itemLink: "https://navajewellery.sa/ar/dPBNxNP", category: "Necklaces"),
    Suggestion(itemImage: "suggest16", itemTitle: "Pearl Earrings", itemPrice: 495.61, itemLink: "https://navajewellery.sa/ar/DyBqPB", category: "Earrings"),

    Suggestion(itemImage: "suggest12", itemTitle: "Gold Bracelet", itemPrice: 378.56, itemLink: "https://navajewellery.sa/ar/RAKzlvw", category: "Bracelets"),
    
    Suggestion(itemImage: "suggest13", itemTitle: "Gold Necklace", itemPrice: 3130.00, itemLink: "https://navajewellery.sa/ar/rAxvOZy", category: "Necklaces"),
    Suggestion(itemImage: "suggest10", itemTitle: "Gold Ring", itemPrice: 820.02, itemLink: "https://navajewellery.sa/ar/zvKDrmG", category: "Rings"),
    Suggestion(itemImage: "suggest15", itemTitle: "Gold Necklace", itemPrice: 2619.14, itemLink: "https://navajewellery.sa/ar/xaVKdq", category: "Necklaces"),

    Suggestion(itemImage: "suggest8", itemTitle: "24 karat gold ingot", itemPrice: 6418.44, itemLink: "https://navajewellery.sa/ar/NmjaDB", category: "Bracelets")

]
