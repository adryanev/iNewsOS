//
//  AboutPage.swift
//  iNewsOs
//
//  Created by Adryan Eka Vandra on 02/04/23.
//

import SwiftUI

struct AboutPage: View {
    var body: some View {
        VStack() {
            Image("potrait")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(
                    width: 200
                )
            Text("Adryan Eka Vandra")
                .font(.title)
            Link("adryanekavandra@gmail.com", destination: URL(string: "mailto:adryanekavandra@gmail.com")!)
                .padding(.bottom, 8)
            Link("My Blog", destination: URL(string: "https://belajarinformatika.com")!)
            Spacer()
            
        }
        .navigationTitle("About")
        
    }
}

struct AboutPage_Previews: PreviewProvider {
    static var previews: some View {
        AboutPage()
    }
}
