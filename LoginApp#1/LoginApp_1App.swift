//
//  LoginApp_1App.swift
//  LoginApp#1
//
//  Created by Alonso Alas on 5/24/23.
//

import SwiftUI
import Firebase

@main
struct LoginApp_1App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
