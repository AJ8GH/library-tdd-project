require 'yaml'

class Library

  attr_accessor :books

  def initialize(lib_file = false)
    @lib_file = lib_file
    @books = lib_file ? YAML::load(File.read(@lib_file)) : []
  end

  def get_books_in_category(category)
    books.select { |book| book.category == category }
  end

  def add_book(new_book)
    books << new_book unless books.include?(new_book)
  end

  def get_book(title)
    books.select { |book| book.title == title }.pop
  end

  def save(lib_file = false)
    @lib_file = lib_file || @lib_file || 'library.yml'
    File.open(@lib_file, 'w') do |f|
      f.write YAML::dump @books
    end
  end
end
