//
//  DinCharyaApp.swift
//  DinCharya
//
//  Created by Ganpat Jangir on 02/05/24.
//

import SwiftUI

@main
struct DinCharyaApp: App {
    
    @StateObject var listVM = ListViewModel(DatabaseManager())
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listVM)
        }
    }
}
