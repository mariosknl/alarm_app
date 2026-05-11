import SwiftUI

struct YouDidItView: View {
    let youDidIt: LocalizedStringKey = "you did it! Here you can manage your alarm, change time and other things"
    
    var body: some View {
        ZStack {
            MainGradient(endRadius: 120, scaleX: 1.5, yellowColor: darkYellow)
                .cornerRadius(20)
                .frame(height: screenHeight / 4)
                .overlay(
                    HStack {
                        CoolTextView(
                            text: youDidIt,
                            size: 18
                        )
                        .padding(.horizontal)
                        .padding(.horizontal)
                        .multilineTextAlignment(.leading)
                        .frame(width: screenWidth / 1.8)
                        
                        Spacer()
                        
                        Image(partyPerson)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal)
                            .opacity(0.9)
                    }
                )
                .padding()
        }
    }
}

#Preview {
    ZStack {
        black.opacity(0.5).ignoresSafeArea()
        YouDidItView()
        
    }
}
