//
//  AddBookView.swift
//  Bookworm
//
//  Created by Justin Hold on 10/10/22.
//

import SwiftUI

struct AddBookView: View {
   
	// MARK: - PROPERTIES
	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) var dismiss
	
	@State private var title: String = ""
	@State private var author: String = ""
	@State private var rating: Int = 3
	@State private var genre: String = "Fantasy"
	@State private var review: String = ""
	
	let genres: [String] = [
		"Fantasy",
		"Horror",
		"Kids",
		"Mystery",
		"Poetry",
		"Romance",
		"Thriller"
	]
    
	// MARK: - VIEW BODY
    var body: some View {
		
		NavigationStack {
			Form {
				
				Section {
					TextField("Name of book", text: $title)
					TextField("Author's name", text: $author)
					
					Picker("Genre", selection: $genre) {
						ForEach(genres, id: \.self) {
							Text($0)
						}
					}
					.pickerStyle(.menu)
				}
				
				Section("Leave a review") {
					TextEditor(text: $review)
					
					RatingView(rating: $rating)
				}
				
				Section {
					Button("Save") {
						// defines the new book a user entered
						let newBook = Book(
							title: title,
							author: author,
							genre: genre,
							review: review,
							rating: rating,
							date: .now
						)
						// adds the new book to the DataModel
						modelContext.insert(newBook)
						dismiss()
					}
					.disabled(title.isEmpty || author.isEmpty)
				}
			}
			.navigationTitle("Add Book")
		}
    }
}

#Preview {
	AddBookView()
}
