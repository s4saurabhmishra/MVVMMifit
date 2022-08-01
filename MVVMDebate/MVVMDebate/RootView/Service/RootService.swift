//
//  RootService.swift
//  MVVMDebate
//
//  Created by Mishra, Saurabh on 21/07/22.
//

import Foundation
enum NetworkError: Error {
    case invalidUrl
    case invalidServerResponse
    case custom(String)

}

class RootService: ObservableObject {
    
    @Published var rootView: RootModel?
    @Published var view1Model: View1Model?
    @Published var view2Model: View2Model?
    @Published var view3Model: View3Model?

    func populateRootViewApi() async throws {
        let (data, response) = try await URLSession.shared.data(from: URL(string: "https://c5ab03c2-1463-462d-b186-3f79cf9a9148.mock.pstmn.io/rootApi")!)
        guard (response as? HTTPURLResponse)?.statusCode != 200 else { throw NetworkError.custom("Error occured") }
        
        Task { @MainActor in
            do {
                self.rootView = try JSONDecoder().decode(RootModel.self, from: data)
                
                //dummy nested call
                try? await self.populateView1Api()

            } catch {
                throw NetworkError.custom("Error occured while parsing the model")
            }
        }
    }
    
    func populateView1Api() async throws {
        
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://c5ab03c2-1463-462d-b186-3f79cf9a9148.mock.pstmn.io/view1")!)
        
        Task { @MainActor in
            self.view1Model = try JSONDecoder().decode(View1Model.self, from: data)
        }
    }
    
    func populateView2Api() async throws {
        
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://c5ab03c2-1463-462d-b186-3f79cf9a9148.mock.pstmn.io/view2")!)
        
        Task { @MainActor in
            self.view2Model = try JSONDecoder().decode(View2Model.self, from: data)
        }
    }
    
    func populateView3Api() async throws {
        
        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://c5ab03c2-1463-462d-b186-3f79cf9a9148.mock.pstmn.io/view3")!)
        
        Task { @MainActor in
            self.view3Model = try JSONDecoder().decode(View3Model.self, from: data)
        }
    }
}
