//
//  ContentView.swift
//  Starlite
//
//  Created by Martin McKenna on 7/13/26.
//

import SwiftUI

struct ContentView: View {
//    
//    @State private var viewModel = View
//    
//    var body: some View {
//        CameraView(image: $viewModel.currentFrame)
//    }
    
    
    var body: some View {
        let day = getDate()
        let time = getTime()
        VStack {
            Image("Declan")
                .resizable()
                .cornerRadius(20)
                .aspectRatio(contentMode: .fit)
                .padding(.all)
            Text(day, format: .number)
            Text(time, format: .number)
        }
        .padding()
    }
}

struct ContentView_Preview:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
