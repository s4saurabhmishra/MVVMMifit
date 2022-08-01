//
//  View1.swift
//  MVVMDebate
//
//  Created by Mishra, Saurabh on 21/07/22.
//

import SwiftUI

struct View1: View {
    @EnvironmentObject var rootServices: RootService
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            if rootServices.view1Model == nil {
                ProgressView()
            } else {
                Text("Hello I am \(rootServices.view1Model?.view1 ?? "")")
                    .font(.title)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(Color.yellow)
        //.task {
            //isLoading = true
            //try? await rootServices.populateView1Api()
            //isLoading = false
        //}
    }
}

struct View1_Previews: PreviewProvider {
    static var previews: some View {
        View1()
    }
}
