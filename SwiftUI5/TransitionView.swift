//
//  TransitionView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 08/06/23.
//

import SwiftUI

struct TransitionView: View {
    @State private var showView:Bool = false
    
    var body: some View {
        VStack{
            if showView {
                Rectangle()
                    .fill(.red.gradient)
                    .frame(width: 150, height: 150)
                    .transition(MyTransition())
            }
            Button("Show View") {
                withAnimation {
                    showView.toggle()
                }
            }
        }
    }
}

struct MyTransition:Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .rotation3DEffect(
                .init(degrees: phase.value * (phase == .willAppear ? 90 : -90)),
                         axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
            .scaleEffect(phase.isIdentity ? 1 : 0.6)
    }
}

#Preview {
    TransitionView()
}
