//
//  View3.swift
//  MVVMDebate
//
//  Created by Mishra, Saurabh on 21/07/22.
//

import SwiftUI

struct View3: View {
    //var model: View3Model

    var body: some View {
        VStack {
            Text("Hello I am View 3")
                .font(.title)
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(Color.red)
    }
}

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3()
    }
}
