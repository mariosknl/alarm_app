import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
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
                
                ToBedWalkUpView(
                    currentAlarmIndex: currentAlarmIndex,
                    alarmModel: alarmModel
                )
                
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
        currentAlarmIndex: nil,
        alarmModel: .DefaultAlarm()
        )
}
