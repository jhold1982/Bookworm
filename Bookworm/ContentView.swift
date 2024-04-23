//
//  ContentView.swift
//  Bookworm
//
//  Created by Justin Hold on 10/8/22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	
	// MARK: - PROPERTIES
	@Environment(\.modelContext) var modelContext
	
	@Query(sort: [
		SortDescriptor(\Book.title),
		SortDescriptor(\Book.rating)
	]) var books: [Book]
    
	@State private var showingAddBook: Bool = false
	
	// MARK: - VIEW BODY
    var body: some View {
		NavigationStack {
			List {
				ForEach(books) { book in
					NavigationLink(value: book) {
						HStack {
							EmojiRatingView(rating: book.rating)
								.font(.largeTitle)
							
							VStack(alignment: .leading) {
								
								Text(book.title)
									.font(.headline)
									.foregroundStyle(book.rating == 1 ? .red : .primary)
								
								Text(book.author)
									.foregroundStyle(.secondary)
							}
						}
					}
					.opacity(book.rating == 1 ? 0.5 : 1)
				}
				.onDelete(perform: deleteBooks)
			}
			.navigationTitle("📕Bookworm🐛")
			.navigationDestination(for: Book.self) { book in
				DetailView(book: book)
			}
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button("Add book", systemImage: "plus") {
						showingAddBook.toggle()
					}
				}
				ToolbarItem(placement: .topBarLeading) {
					EditButton()
				}
			}
			.sheet(isPresented: $showingAddBook) {
				AddBookView()
			}
		}
    }
	
	// MARK: - FUNCTIONS
	/// Method to delete books from array
	/// - Parameter offsets: resets the position of books in the array
	func deleteBooks(at offsets: IndexSet) {
		for offset in offsets {
			// find this book in our query
			let book = books[offset]
			
			// delete it from the context
			modelContext.delete(book)
		}
	}
}

#Preview {
	ContentView()
}
