//
//  TabBar.swift
//  ThahabHub
//
//  Created by Noura Alowayid on 15/11/1444 AH.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab = 0
    var body: some View {
        NavigationStack{
            VStack {
                TabView {
                    // First tab
                    MainPage()
                        .tabItem {
                            Image(systemName:"homekit")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10)
                            Text("Main")
                        }
                    
                    // Second tab
                    CalculateView()
                        .tabItem {
                            Image(systemName: "dollarsign.circle")
                            Text("Calculate")
                        }
                    
                    // Third tab
                    TheHub()
                        .tabItem {
                            Image(systemName: "bell.badge")
                            Text("Hub")
                        }
                    
                    // Fourth tab
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.circle.fill")
                            Text("Profile")
                            
                        }
                }
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
