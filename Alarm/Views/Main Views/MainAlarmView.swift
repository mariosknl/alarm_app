import SwiftUI

struct MainAlarmView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        TabView {
            if lnManager.isAuthorized {
                ListOfTheAlarmsView()
                    .tabItem({
                        Label("Alarms", systemImage: "alarm.fill")
                    })
                
                AboutView()
                    .tabItem({
                        Label("About", systemImage: "info.circle.fill")
                    })
            } else {
                EnableNotifications()
            }
        }
        .ignoresSafeArea()
        .task {
            try? await lnManager
                .requestAuthorization()
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                Task {
                    await lnManager.getCurrentSettings()
                    
                    await lnManager
                        .getPendingAlarms()
                }
            }
        }
    }
}

#Preview {
    MainAlarmView()
}
