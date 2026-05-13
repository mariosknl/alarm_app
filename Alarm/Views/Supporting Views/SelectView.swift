//
//  SelectView.swift
//  Alarm
//
//  Created by Marios Kanellopoulos on 13/5/26.
//

import SwiftUI

struct SelectView: View {
    let width: CGFloat
    @Binding var addEditViewType: AddEditViewType
    @Binding var isActive: Bool
    
    var isStandardView: Bool {
        addEditViewType == .standard
    }
    
    var body: some View {
        HStack {
            Button(
                action: {
                    withAnimation {
                        addEditViewType = .standard
                        isActive = true
                    }
                },
                label: {
                    ImageDisplayView(
                        name: standardViewImage,
                        width: 50
                    )
                    .scaleEffect(isStandardView ? 1.05 : 1.0)
                    .shadow(
                        color: .blue,
                        radius: isStandardView ? 5 : 0,
                        x: 0,
                        y: 0
                    )
            })
            
            Spacer()
            
            Button(
                action: {
                    withAnimation {
                        addEditViewType = .circular
                        isActive = true
                    }
                },
                label: {
                    ImageDisplayView(
                        name: circularViewImage,
                        width: 50
                    )
                    .scaleEffect(isStandardView ? 1.0 : 1.05)
                    .shadow(
                        color: .blue,
                        radius: isStandardView ? 0 : 5,
                        x: 0,
                        y: 0
                    )
            })
        }.padding()
    }
}

#Preview {
    SelectView(
        width: 50,
        addEditViewType: .constant(.standard),
        isActive: .constant(true)
    )
}
