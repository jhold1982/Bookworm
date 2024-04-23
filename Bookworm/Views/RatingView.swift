//
//  RatingView.swift
//  Bookworm
//
//  Created by Justin Hold on 10/10/22.
//

import SwiftUI

struct RatingView: View {
	
	// MARK: - PROPERTIES
	@Binding var rating: Int
	
	var label: String = ""
	var maximumRating: Int = 5
	
	var offImage: Image?
	var onImage = Image(systemName: "star.fill")
	
	var offColor = Color.gray
	var onColor = Color.yellow
	
	// MARK: - VIEW BODY
	var body: some View {
		
		HStack {
			
			if label.isEmpty == false {
				Text(label)
			}
			
			ForEach(1..<maximumRating + 1, id: \.self) { number in
				Button {
					rating = number
				} label: {
					image(for: number)
						.foregroundStyle(number > rating ? offColor : onColor)
				}
			}
		}
		// add to HStack because Swift treams Form as an entire clickable button
		.buttonStyle(.plain)
	}
	
	// MARK: - FUNCTIONS
	/// Method to tie Image + Color to rating integer
	/// - Parameter number: numeric rating
	/// - Returns: star image that represents rating
	func image(for number: Int) -> Image {
		if number > rating {
			offImage ?? onImage
		} else {
			onImage
		}
	}
}

#Preview {
	RatingView(rating: .constant(4))
}
