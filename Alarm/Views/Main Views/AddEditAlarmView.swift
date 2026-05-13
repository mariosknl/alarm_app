import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    @State private var showYouDidItView: Bool = true
    
    var body: some View {
        ZStack {
            backgroundColor
                .opacity(0.7)
                .ignoresSafeArea()

            VStack {
                if showYouDidItView {
                    YouDidItView()
                }
                
                if let currentAlarmIndex = currentAlarmIndex {
                    ToBedWalkUpView(
                        currentAlarmIndex: currentAlarmIndex,
                        alarmModel: lnManager.alarmViewModels[currentAlarmIndex]
                    )
                } else {
                    ToBedWalkUpView(
                        currentAlarmIndex: currentAlarmIndex,
                        alarmModel: .DefaultAlarm()
                    )
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(
                deadline: .now() + 2.0) {
                    withAnimation {
                        showYouDidItView = false
                    }
                }
        }
    }
}

#Preview {
    AddEditAlarmView(
        currentAlarmIndex: nil)
    .environmentObject(LocalNotificationManager())
        
}
