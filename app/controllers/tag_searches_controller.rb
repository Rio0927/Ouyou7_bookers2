class TagSearchesController < ApplicationController
    def search
        @model = Book
        @word = params[:word]
        @books = Book.where("category LIKE?","%#{@word}%")
        render "tag_searches/tagsearch"
    end
end
