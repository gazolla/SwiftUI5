//
//  ObservableView.swift
//  SwiftUI5
//
//  Created by sebastiao Gazolla Costa Junior on 09/06/23.
//

import SwiftUI
import SwiftData

struct ObservableView: View {
    @Bindable var user: User = .init()
    @State private var showAlert:Bool = false
    var body: some View {
        
        NavigationStack {
            VStack{
                List{
                    Section{
                        TextField("Name", text:$user.name)
                        TextField("Password", text:$user.pwd)
                    }
                    Section {
                        Button("Login"){
                            showAlert.toggle()
                        }
                    }
                }
            }
            .navigationTitle("Login")
            .alert(isPresented: $showAlert, content: {
                Alert(title:Text("Result"), message: Text("\(user.name)  \(user.pwd)"))
            })
            
        }
        
    }
}

#Preview {
    ObservableView()
}

@Observable
class User {
    var name:String = ""
    var pwd:String = ""
}
