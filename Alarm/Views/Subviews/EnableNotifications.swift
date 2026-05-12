import SwiftUI

struct EnableNotifications: View {
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    var body: some View {
        ZStack {
            FourCoolCircles()
            VStack {
                Spacer()
                CoolTextView(
                    text: LocalizedStringKey("Enable notifications, please"),
                    size: 48
                )
                .multilineTextAlignment(.center)
                Spacer()
                
                Button(
                    action: {
                        lnManager.openSettings()
                    },
                    label: {
                       ButtonView(text: "Enable")
                            .padding()                        
                    }
                )
            }
        }
    }
}

#Preview {
    EnableNotifications()
        .environmentObject(LocalNotificationManager())
}
