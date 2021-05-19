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
    let area: Area
    @State private var selectedCluster: Int?
    
    var body: some View {
        ZStack {
            MapView(area: area) {index in
                selectedCluster = index
            }
            NavigationLink( destination: ClusterPage(cluster: area.clusters[0]), tag: 0, selection: $selectedCluster){
                EmptyView()
            }
        }
    }
}

struct AreaMapPage_Previews: PreviewProvider {
    static var previews: some View {
        
        AreaMapPage(area: Areas().getArea(index: 0))
    }
}
