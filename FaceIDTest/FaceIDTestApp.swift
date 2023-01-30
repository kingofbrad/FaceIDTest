//
//  FaceIDTestApp.swift
//  FaceIDTest
//
//  Created by Bradlee King on 26/10/2022.
//

import SwiftUI

@main
struct FaceIDTestApp: App {
    @StateObject var appContext = AppContext()
        
        var body: some Scene {
            WindowGroup {
                ContentView(appContext: AppContext())
            }
        }
}
