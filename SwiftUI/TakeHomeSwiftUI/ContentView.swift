//
//  ContentView.swift
//  TakeHomeSwiftUI
//
//  Created by Enrique Gongora on 6/3/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var network = Network()
    
    var body: some View {
        List(network.stateNames, id: \.self) { state in
            Text(state)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
