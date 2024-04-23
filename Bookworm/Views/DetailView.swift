//
//  DetailView.swift
//  Bookworm
//
//  Created by Justin Hold on 10/10/22.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
	// MARK: - PROPERTIES
	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) var dismiss
	
	@State private var showingDeleteAlert: Bool = false
	
	let book: Book
	
	// MARK: - VIEW BODY
    var body: some View {
		ScrollView {
			ZStack(alignment: .bottomTrailing) {
				Image(book.genre)
					.resizable()
					.scaledToFit()
				
				Text(book.genre.uppercased())
					.font(.caption)
					.fontWeight(.black)
					.padding(8)
					.foregroundStyle(.white)
					.background(.black.opacity(0.75))
					.clipShape(.capsule)
					.offset(x: -5, y: -5)
			}
			
			Text(book.author)
				.font(.title)
				.foregroundStyle(.secondary)
			
			Text(book.review)
				.padding()
			
			Text(book.date.formatted(date: .abbreviated, time: .omitted))
				.padding()
			
			RatingView(rating: .constant(book.rating))
				.font(.largeTitle)
		}
		.navigationTitle(book.title)
		.navigationBarTitleDisplayMode(.inline)
		.scrollBounceBehavior(.basedOnSize)
		.toolbar {
			Button("Delete this book", systemImage: "trash") {
				showingDeleteAlert = true
			}
		}
		.alert("Delete book", isPresented: $showingDeleteAlert) {
			Button("Delete", role: .destructive, action: deleteBook)
			Button("Cancel", role: .cancel) { }
		} message: {
			Text("Are you sure?")
		}
    }
    
	// MARK: - FUNCTIONS
	/// Method to delete book from screen list, then dismisses view
	func deleteBook() {
		modelContext.delete(book)
		dismiss()
	}
}

#Preview {
	do {
		let config = ModelConfiguration(isStoredInMemoryOnly: true)
		let container = try ModelContainer(for: Book.self, configurations: config)
		let example = Book(
			title: "Test Book",
			author: "Test Author",
			genre: "Fantasy",
			review: "Woweee",
			rating: 4,
			date: .now
		)
		
		return DetailView(book: example)
			.modelContainer(container)
	} catch {
		return Text("Failed to create preview: \(error.localizedDescription)")
	}
}


