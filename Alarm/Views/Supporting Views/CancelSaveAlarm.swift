import SwiftUI

struct CancelSaveAlarm: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        HStack {
            // Cancel
            Button(action: {
                print("Cancel - todo")
            }, label: {
                Text("cancel")
            })
            
            Spacer()
            
            // Save
            Button(action: {
                print("Save - todo")
                if let currentAlarmIndex = currentAlarmIndex {
                    // Edit alarm to view model
                    print("current alarm index: \(currentAlarmIndex)")
                } else {
                    // Append alarm to view model
                }
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
}
