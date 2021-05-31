//
//  AreaMapPage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/17/21.
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

struct AreaMapPage: View {
    @EnvironmentObject var areaVM: AreaViewModel
    @State private var selectedCluster: Int?
    
    var body: some View {
        ZStack {
            AreaMapView(area: areaVM.area) { index in
                selectedCluster = index
            }
            
            ForEach (0 ..< areaVM.area.clusters.count) { index in
                NavigationLink(
                    destination: ClusterPage(cluster: areaVM.area.clusters[index]),
                    tag: index,
                    selection: $selectedCluster) {
                    EmptyView()
                }
            }
        }
    }
}

struct AreaMapPage_Previews: PreviewProvider {
    static var previews: some View {
        if let area = try? Areas.loadArea("stoney_point.json") {
            AreaMapPage()
                .environmentObject(AreaViewModel(area))
        }
    }
}
