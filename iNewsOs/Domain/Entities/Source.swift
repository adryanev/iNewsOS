//
//  Source.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 26/03/23.
//

import Foundation

struct Source: Equatable, Hashable, Identifiable {
    let id: String?
    let name: String
}

extension Source {
    
    func with(
        id: String?? = nil,
        name: String?? = nil
    ) -> Source {
        return Source(
            id: id ?? self.id,
            name: (name ?? self.name)!
        )
    }
}
