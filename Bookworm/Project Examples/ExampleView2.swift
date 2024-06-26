//
//  ExampleView2.swift
//  Bookworm
//
//  Created by Justin Hold on 3/21/23.
//

// MARK: - Accepting multi-line text input with TextEditor

import SwiftUI

struct ExampleView2: View {
	
	@AppStorage("notes") private var notes = ""
	
    var body: some View {
		NavigationStack {
			TextField("Enter your text", text: $notes, axis: .vertical)
				.textFieldStyle(.roundedBorder)
				.navigationTitle("Notes")
				.padding()
		}
    }
}

struct ExampleView2_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView2()
    }
}
