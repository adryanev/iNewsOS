//
//  iNewsOsApp.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 25/03/23.
//

import SwiftUI

@main
struct iNewsOsApp: App {
    var body: some Scene {
        let newsViewModel = InjectionContainer.shared.container.resolve(NewsViewModel.self)!
        WindowGroup {
            NewsPage(viewModel: newsViewModel)
        }
    }
}
