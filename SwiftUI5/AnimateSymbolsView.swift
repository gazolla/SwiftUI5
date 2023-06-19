//
//  AnimateSymbolsView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 16/06/23.
//

import SwiftUI

struct AnimateSymbolsView: View {
    @State private var animate:Bool = false
    var body: some View {
        VStack{
            List{
                Image(systemName:animate ? "moon.stars" : "sun.max.fill")
                    .font(.largeTitle)
                    .foregroundColor(animate ? .blue : .yellow)
                    .contentTransition(.symbolEffect(.replace.offUp))
                
                Image(systemName: "iphone.radiowaves.left.and.right")
                    .font(.largeTitle)
                    .symbolEffect(.variableColor.iterative, options: .repeat(4), value:animate)
                
                Image(systemName: "wifi.router")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .symbolEffect(.variableColor.iterative.reversing)
                
                Image(systemName: "touchid")
                    .font(.largeTitle)
                    .symbolEffect(.bounce.up.byLayer, options: .repeating, value: animate)
                
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:30, height:30)
                        .foregroundColor(.secondary)
                    Image(systemName: "lock.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .symbolEffect(.disappear, isActive:animate)
                    Circle()
                        .frame(width:30, height:30)
                        .foregroundColor(.secondary)
                }
                
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width:35, height:35)
                        .foregroundColor(.secondary)
                    
                    if !animate {
                        Image(systemName: "lock.fill")
                            .transition(.symbolEffect(.disappear.down))
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            
                    }
                    
                    Circle()
                        .frame(width:35, height:35)
                        .foregroundColor(.secondary)
                }
            }
            .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Button("Animate"){
                withAnimation {
                    animate.toggle()
                }
               
            }
        }
    }
}

#Preview {
    AnimateSymbolsView()
}
