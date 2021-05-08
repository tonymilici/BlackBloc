//
//  ListItemView.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/8/21.
//  Copyright © 2021 Imortal Apps. All rights reserved.
//

import SwiftUI

struct ListItemView: View {
    let item: ListItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.label)
            Text(item.detail)
                .font(.system(size: 12))
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(item: ListItem(label: "Label", detail: "Detail"))
    }
}
