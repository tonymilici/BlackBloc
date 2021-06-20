//
//  MainPage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/17/21.
//  Copyright © 2021 BlackBloc Software. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE./

import SwiftUI

struct TabPage: View {
    @EnvironmentObject private var area: AreaViewModel
    @State private var selection: Tab = .navigate
    @State private var showingAlert = false
    
    private enum Tab {
        case navigate
        case routes
    }
    
    var body: some View {
        TabView(selection: $selection) {
            AreaMapPage()
                .tabItem {
                    Label("Navigate", systemImage: "safari")
                }
                .tag(Tab.navigate)
            
            RoutesPage()
                .tabItem {
                    Label("Routes", systemImage: "list.bullet")
                }
                .tag(Tab.routes)
        }
        .navigationTitle(area.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: { showingAlert = true }) {
                Image(systemName: "icloud.and.arrow.down")
            }
        }
        .alert(isPresented: $showingAlert) {
            showSyncAlert()
        }
    }
    
    func showSyncAlert() -> Alert {
        Alert(
            title: Text("Download Images"),
            message: Text("Save images to disk so they will be available if you need to use the app offline."),
            primaryButton: .default(Text("Sync")) {
                area.syncImages()
            },
            secondaryButton: .cancel())
    }
}

struct TabPage_Previews: PreviewProvider {
    static var previews: some View {
        if let area = try? Areas.loadArea("stoney_point.json") {
            TabPage()
                .environmentObject(AreaViewModel(area))
        }
    }
}
