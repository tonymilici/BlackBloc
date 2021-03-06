//
//  ProgressDialog.swift
//  BoulderingGuide
//
//  Created by Tony Milici on 6/24/21.
//

import SwiftUI

struct ProgressDialog: View {
    var progress: Progress
    var cancel: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
            VStack(spacing: 20) {
                Text("Syncing Images")
                ProgressView(progress)
                    .progressViewStyle(LinearProgressViewStyle())
                    .frame(width:160)
                Button("Cancel") {
                    cancel()
                }
            }
            .padding(40)
            .background(RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white))
        }
    }
}

struct ProgressDialog_Previews: PreviewProvider {
    static var previews: some View {
        ProgressDialog(progress: Progress(totalUnitCount: 500)) {
            
        }
    }
}
