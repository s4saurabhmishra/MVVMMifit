//
//  RootView.swift
//  MVVMDebate
//
//  Created by Mishra, Saurabh on 21/07/22.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootServices: RootService
    @State private var showLoader = false
    @State private var errorMessage = ""
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            if !showLoader {
                VStack {
                    Text("ROOT VIEW")
                        .font(.largeTitle)
                    View1()
                    View2()
                    View3()
                }
            } else {
                ProgressView()
            }
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text(errorMessage))
        })
        .task {
            showLoader = true
            do {
                try await rootServices.populateRootViewApi()
            } catch NetworkError.custom(let message) {
                showAlert = true
                errorMessage = message
            } catch {
                showAlert = true
                errorMessage = error.localizedDescription
            }
            showLoader = false
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
