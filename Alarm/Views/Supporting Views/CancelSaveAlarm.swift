import SwiftUI

struct CancelSaveAlarm: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        HStack {
            // Cancel
            Button(action: {
                self.presentation
                    .wrappedValue
                    .dismiss()
            }, label: {
                Text("cancel")
            })
            
            Spacer()
            
            // Save
            Button(action: {
                if let currentAlarmIndex = currentAlarmIndex {
                    // save alarm
                    lnManager.alarmViewModels[currentAlarmIndex] = alarmModel
                } else {
                    // Append alarm to view model
                    lnManager
                        .safeAppend(localNotification: alarmModel)
                }
                
                // Schedule Alarm
                Task {
                    if alarmModel.alarmEnabled {
                        await lnManager
                            .schedule(localNotification: alarmModel)
                    } else {
                        lnManager
                            .removeRequest(id: alarmModel.id)
                    }
                }
                self.presentation
                    .wrappedValue
                    .dismiss()
            }, label: {
                Text("Save")
            })
            
        }
    }
}

#Preview {
    CancelSaveAlarm(
        currentAlarmIndex: nil,
        alarmModel: .constant(.DefaultAlarm())
    )
    .environmentObject(LocalNotificationManager())
}
