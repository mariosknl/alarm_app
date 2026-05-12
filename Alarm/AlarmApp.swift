//
//  AlarmApp.swift
//  Alarm
//
//  Created by Marios Kanellopoulos on 11/5/26.
//

import SwiftUI

@main
struct AlarmApp: App {
    @StateObject var lnManager: LocalNotificationManager = LocalNotificationManager()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(lnManager)
        }
    }
}
