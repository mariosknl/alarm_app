import SwiftUI

struct EnableNotifications: View {
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
                    action: { print("TODO enable notifications")},
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
}
