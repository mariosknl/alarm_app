import SwiftUI

enum AddEditViewType {
    case standard, circular
}

struct ChooseAlarmView: View {
    @Binding var currentAlarmIndex: Int?
    @EnvironmentObject var lnManager: LocalNotificationManager
    let addEditViewType: AddEditViewType
    
    var body: some View {
        if let currentAlarmIndex = currentAlarmIndex {
            if addEditViewType == .standard {
                AddEditAlarmView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: lnManager.alarmViewModels[currentAlarmIndex]
                )
            } else {
                Text("Use circular")
            }
            
        } else {
            if addEditViewType == .standard {
                
                AddEditAlarmView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: .DefaultAlarm()
                )
            } else {
                Text("Use circular")
            }
        }
    }
}

#Preview {
    ChooseAlarmView(currentAlarmIndex: .constant(nil), addEditViewType: .standard)
}
