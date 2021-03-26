//
//  ContentView.swift
//  FB Parsed Sequence
//
//  Created by Dmitry Novosyolov on 24/03/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject
    private var vm = ViewModel()
    var body: some View {
        if vm.flag {
            NavigationView {
                ListView(vm: vm)
                    .navigationTitle("Sequence Parser")
            }
            .navigationViewStyle(StackNavigationViewStyle())
        } else {
            ProgressView("Loading...")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
