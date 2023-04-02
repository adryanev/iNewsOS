//
//  Failure.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 01/04/23.
//

import Foundation

enum Failure: Error {
    case remoteFailure(reason: String)
    case unexpectedFailure(reason: String)
}
