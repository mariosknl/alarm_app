import SwiftUI

struct TheToggleView: View {
    var width = 35.0
    let factor = 59.0 / 35.0
    let innerCircleFactor = 59.0 / 25.0
    @Binding var isOn: Bool
    
    let offsetDelta = 12.0
    var sign: Double {
        isOn ? 1.0 : -1.0
    }
    var xShift: Double {
        // Should range from -offsetData to offsetDelta
        sign*offsetDelta
    }
    
    // This should be a value between 0.5 and 1
    var backgroundWhiteness: Double {
        var result = xShift + offsetDelta
        result = result / (2 * offsetDelta)
        // Normalize
        result = result * 0.5
        // Change the range from 0 to 0.5
        // flip result, i.e 0 -> 0.5 and
        // 0.5 -> 0
        result = 0.5 - result
        return result
    }
    
    var textColor: Color {
        isOn ? lightGray : black
    }
    
    var onOffText: LocalizedStringKey {
        isOn ? "on" : "off"
    }
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { gesture in
                withAnimation(.easeIn(duration: 0.2)) {
                    isOn = gesture.translation.width > 0 ? true : false
                }
            }
        
        let tapGesture = TapGesture()
            .onEnded { _ in
                withAnimation(.easeIn(duration: 0.2)) {
                    isOn.toggle()
                }
            }
        
        let combinedGesture = dragGesture.simultaneously(with: tapGesture)
        
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    Color(white: backgroundWhiteness)
                )
            // on/off text
            ShiftedText(
                text: onOffText,
                color: textColor,
                xShift: -xShift
            )
            
            // Circula "knob"
            ShiftedCircle(xShift: xShift)
        }
        .frame(width: width*factor, height: width, alignment: .leading)
        .gesture(combinedGesture)
    }
}

struct ShiftedCircle: View {
    let color: Color = cardBackgroundColor
    let xShift: Double
    var padding: Double = 7.0
    
    var body: some View {
        Circle()
            .fill(color)
            .padding(padding)
            .offset(x: xShift)
    }
}

struct ShiftedText: View {
    let text: LocalizedStringKey
    let color: Color
    let xShift: Double
    var body: some View {
        Text(text)
            .foregroundColor(color)
            .font(.subheadline)
            .offset(x: xShift)
    }
}

#Preview {
    VStack {
        TheToggleView(isOn: .constant(true))
        
        TheToggleView(isOn: .constant(false))
    }
}
