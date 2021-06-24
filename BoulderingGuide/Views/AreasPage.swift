//
//  AreasView.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/19/21.
//  Copyright © 2021 BlackBloc Software. All rights reserved.
//
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

struct AreasPage: View {
    @EnvironmentObject private var areas: Areas
    @State private var showingPrefs = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(areas.areas) { area in
                        NavigationLink(destination: TabPage().environmentObject(area).environment(\.areaName, area.name)) {
                            Text(area.name)
                        }
                    }
                }
                Image("stoney_point").resizable()
            }
            .navigationTitle("Areas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: { showingPrefs.toggle() }) {
                    Image(systemName: "gearshape")
                }
            }
            .sheet(isPresented: $showingPrefs) {
                PrefsPage()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AreasView_Previews: PreviewProvider {
    static var previews: some View {
        AreasPage()
            .environmentObject(Areas())
    }
}
