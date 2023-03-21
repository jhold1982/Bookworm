//
//  ExampleView1.swift
//  Bookworm
//
//  Created by Justin Hold on 3/21/23.
//

// MARK: Creating a custom component with @Binding

import SwiftUI

struct PushButton: View {
	let title: String
	@Binding var isOn: Bool
	var onColors = [Color.red, Color.yellow]
	var offColors = [Color(white: 0.6), Color(white: 0.4)]
	var body: some View {
		Button(title) {
			isOn.toggle()
		}
		.padding()
		.background(
			LinearGradient(
				gradient:
					Gradient(colors: isOn ? onColors : offColors),
					startPoint: .top, endPoint: .bottom
			))
		.foregroundColor(.white)
		.clipShape(Capsule())
		.shadow(radius: isOn ? 0 : 5)
	}
}
// Content View
struct ExampleView1: View {
	@State private var rememberMe = false
    var body: some View {
		VStack {
			PushButton(title: "Remember Me", isOn: $rememberMe)
			Text(rememberMe ? "On" : "Off")
		}
    }
}

struct ExampleView1_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView1()
    }
}
