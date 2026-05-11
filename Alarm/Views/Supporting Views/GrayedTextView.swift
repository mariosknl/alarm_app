import SwiftUI

struct GrayedTextView: View {
    let text: LocalizedStringKey
    var font = Font.headline
    
    var body: some View {
        Text(text)
            .foregroundColor(.gray)
            .font(font)
    }
}

#Preview {
    ScrollView {
        VStack(alignment: .leading, spacing: 30) {
            GrayedTextView(text: "The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky.", font: .title)
        }
        .padding()
    }
}
