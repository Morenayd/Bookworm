//
//  AddBookView.swift
//  Bookworm
//
//  Created by Jesutofunmi Adewole on 25/07/2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 0
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller",]
    
    var incompleteDetails: Bool {
        if title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty {
            return true
        } else {
            return false
        }
    }

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
                }
                Section("Write a review") {
                    TextEditor(text: $review)
                }
                
                RatingView(rating: $rating)
                
                Button("Save") {
                    let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                    modelContext.insert(newBook)
                    dismiss()
                }
                .disabled(incompleteDetails)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
