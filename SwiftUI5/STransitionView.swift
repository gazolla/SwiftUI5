//
//  STransitionView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 08/06/23.
//

import SwiftUI

struct STransitionView: View {
    var body: some View {
        ScrollView(.vertical){
            let colors:[Color] = [.gray, .orange, .brown,.red,.blue,.green,.yellow,.purple, .gray, .orange, .brown,.red,.blue,.green,.yellow,.purple]
            LazyVStack(spacing:0){
                ForEach(colors, id:\.self){ color in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(color.gradient)
                        .frame(width: 300, height:300)
                        .padding(.vertical)
                        .containerRelativeFrame(.horizontal)
                    //Scroll Transition
                        .scrollTransition(topLeading: .interactive, bottomTrailing: .interactive) { view, phase in
                            view
                                .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
                        }
                }
            }
        }
    }
}

#Preview {
    STransitionView()
}
