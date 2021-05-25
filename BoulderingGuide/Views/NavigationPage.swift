//
//  NavigationPage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/22/21.
//  Copyright © 2021 BlackBloc Software. All rights reserved.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE./

import SwiftUI

struct NavigationPage: View {
    let location: Location
    let title: String
    
    var body: some View {
        NavigationMapView(location: location)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct NavigationPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPage(location: Areas().areas[0].clusters[0].boulders[0].location!, title: "whateve")
    }
}
