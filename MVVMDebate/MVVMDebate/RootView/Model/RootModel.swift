//
//  RootModel.swift
//  MVVMDebate
//
//  Created by Mishra, Saurabh on 21/07/22.
//

import Foundation

struct RootModel: Codable, Identifiable {
    let status: Bool?
    let rootApi: String?
    
    var id: UUID { return UUID() }
}

struct View1Model: Codable, Identifiable {
    let status: Bool?
    let view1: String?
    
    var id: UUID { return UUID() }
}

struct View2Model: Codable, Identifiable {
    let status: Bool?
    let view2: String?
    
    var id: UUID { return UUID() }
}

struct View3Model: Codable, Identifiable {
    let status: Bool?
    let view3: String?
    
    var id: UUID { return UUID() }
}
