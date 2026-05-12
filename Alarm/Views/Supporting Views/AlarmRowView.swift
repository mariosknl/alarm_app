import SwiftUI

struct AlarmRowView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    let model: AlarmModel
    let i: Int
    
    
    var body: some View {
        HStack {
            Image(systemName: model.activity)
                .foregroundColor(model.activityColor)
                .font(.title)
            
            Text("\(getTimeFromDate(date:model.start))-\(getTimeFromDate(date: model.end))")
                .font(.title)
                .fontWeight(model.alarmEnabled ? .regular : .thin)
                .scaleEffect(model.alarmEnabled ? 1.05 : 1.0)
                .opacity(model.alarmEnabled ? 1.0 : 0.7)
            
            Spacer()
            
            if i < lnManager.alarmViewModels.count {
                TheToggleView(isOn: .constant(lnManager.alarmViewModels[i].alarmEnabled))
            }
            
        }
        .onChange(of: model.alarmEnabled) { oldValue, alarmEnabled in
            if alarmEnabled {
                print("Enable alarm")
                // TODO: Enable alarm
                // TODO: Need schedule function
            } else {
                print("Disable alarm")
                // TODO: Disable alarm
                // TODO: Remove request
            }
        }
    }
}

#Preview {
    AlarmRowView(
        model: .DefaultAlarm(),
        i: 0
    )
    .environmentObject(LocalNotificationManager())
}
