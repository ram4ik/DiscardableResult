//
//  ContentView.swift
//  DiscardableResult
//
//  Created by Ramill Ibragimov on 17.11.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = "SwiftUI"
    
    var body: some View {
        VStack {
            Text(text)
                .padding()
            Button(action: {
                text = log("Message from Discardadble result")
            }, label: {
                Text("Get message")
            })
            .onAppear() {
                log("Discardable Result")
            }
        }
    }
    
    @discardableResult
    private func log(_ message: String,
                     _ file: String = #file,
                     _ line: Int = #line,
                     _function: String = #function) -> String {
        let message = "[\(file):\(line)] \(_function) - \(message)"
        print(message)
        return message
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
