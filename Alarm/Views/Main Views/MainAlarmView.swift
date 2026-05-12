import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        TabView {
            ListOfTheAlarmsView(alarmViewModels: AlarmModel.DummyAlarmData())
                .tabItem({
                    Label("Alarms", systemImage: "alarm.fill")
                })
            
            AboutView()
                .tabItem({
                    Label("About", systemImage: "info.circle.fill")
                })
        }
    }
}

#Preview {
    MainAlarmView()
}
