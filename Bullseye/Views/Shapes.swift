//
//  Shapes.swift
//  Bullseye
//
//  Created by Александр on 14.07.2023.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        VStack {
            Circle()
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: 200.0, height: 100.0)
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: 200.0, height: 100.0)
            Capsule()
                .fill(Color.blue)
                .frame(width: 200.0, height: 100.0)
            Ellipse()
                .fill(Color.blue)
                .frame(width: 200.0, height: 100.0)
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
