//
//  PositionView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 08/06/23.
//

import SwiftUI

struct PositionView: View {
    // SwfitUI now give us the element that is current on scroll
    @State private var scrollPosition: Color?
    
    var body: some View {
        VStack{
            // SwfitUI now give us the element that is current on scroll
            // so we can move to the element directly
            Button ("go to purple"){
                withAnimation {
                    scrollPosition = .purple
                }
            }
            
            ScrollView(.horizontal){
                let colors:[Color] = [.cyan, .green,.yellow,.purple,.red,.blue]
                LazyHStack(spacing:0){
                    ForEach(colors, id:\.self){ color in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(color.gradient)
                            .frame(width: 300, height:300)
                            .padding(.horizontal)
                            .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $scrollPosition)
            .overlay(alignment:.bottom) {
                if let scrollPosition {
                    Text(scrollPosition.name ?? "Other Color")
                        .font(.title.bold())
                        .offset(y: -100)
                }
            }
        }
    }
}

#Preview {
    PositionView()
}

extension Color {
    var name: String? {
        switch self {
        case Color.black: return "black"
        case Color.white: return "white"
        case Color.gray: return "gray"
        case Color.red: return "red"
        case Color.green: return "green"
        case Color.blue: return "blue"
        case Color.cyan: return "cyan"
        case Color.yellow: return "yellow"
        case Color.orange: return "orange"
        case Color.purple: return "purple"
        case Color.brown: return "brown"
        default: return nil
        }
    }
}
