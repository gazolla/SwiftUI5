//
//  ContextMenuView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 09/06/23.
//

import SwiftUI
//we can use ControlGroup in context menus in SwiftUI to show a horizontal strip of action buttons.
struct ContextMenuView: View {
    @State private var isButtonContextMenuVisible = false
    var body: some View {
        
        VStack {
            
            Text("Long Press Me")
                .contextMenu {
                    ControlGroup{
                        Button{
                            
                        } label: {
                            Label("Cut", systemImage: "scissors")
                        }
                        
                        Button{
                        } label:{
                            Label("Copy", systemImage: "doc.on.doc")
                        }
                        
                        Button{
                        } label: {
                            Label("Paste", systemImage: "doc.on.clipboard")
                        }
                        
                        Button(role: .destructive) {
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
        }
    }
}

#Preview {
    ContextMenuView()
}




    
