//
//  View2.swift
//  MVVMDebate
//
//  Created by Mishra, Saurabh on 21/07/22.
//

import SwiftUI

struct View2: View {
    @State private var isLoading = false
    @EnvironmentObject var rootServices: RootService
    
    var body: some View {
        VStack {
            if rootServices.view2Model == nil || isLoading {
                ProgressView()
            } else {
                Text("Hello I am \(rootServices.view2Model?.view2 ?? "")")
                    .font(.title)
            }
            
            retryButton
        }
        .task {
            populateData()
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(Color.green)
    }
    
    private var retryButton: some View {
        Button {
            populateData()
        } label: {
            Text("Retry")
        }
    }
    
    private func populateData() {
        isLoading = true
        Task {
            try? await rootServices.populateView2Api()
            isLoading = false
        }
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        View2()
    }
}
