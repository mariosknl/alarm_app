import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Alarm")
        }
        .padding()
    }
}

#Preview {
    MainAlarmView()
}
