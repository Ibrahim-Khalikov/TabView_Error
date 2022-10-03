//
//  ContentView.swift
//  TabView_Error
//
//  Created by cloud_vfx on 03/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        NavigationView{
            NavigationLink(destination: view1()) {
                Text("Open VIew - 1")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
