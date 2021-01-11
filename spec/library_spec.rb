require 'spec_helper'

describe 'Library Object' do

  before :all do
    lib_arr = [
      Book.new('JavaScript: The Good Parts', 'Douglas Crockford', :development),
      Book.new('Designing with Web Standards', 'Jeffrey Zeldman', :design),
      Book.new("Don't Make me Think", "Steve Krug", :usability),
      Book.new('JavaScript Patterns', 'Stoyan Stefanov', :development),
      Book.new('Responsive Web Design', 'Ethan Marcotte', :design)
    ]

    File.open('books.yml', 'w') do |f|
      f.write YAML::dump lib_arr
    end
  end

  before :each do
    @library = Library.new('books.yml')
  end

  describe '.new' do
    context 'with no parameters' do
      it 'has no books' do
        library = Library.new
        expect(library.books.size).to eq(0)
      end
    end

    context 'with a yaml file name parameter' do
      it 'has 5 books' do
        expect(@library.books.size).to eq(5)
      end
    end
  end

  it 'returns all books in a given category' do
    expect(@library.get_books_in_category(:development).size).to eq(2)
  end

  it 'accepts new books' do
    animal_farm = Book.new('Animal Farm', 'George Orwell', :political_satire)
    @library.add_book(animal_farm)
    expect(@library.books.include?(animal_farm)).to be true
  end

  it 'returns book by title' do
    @library.add_book(Book.new('Designing for the Web', 'Mark Boulton', :design))
    expect(@library.get_book('Designing for the Web')).to be_an_instance_of(Book)
  end

  it 'saves the library' do
    books = @library.books.map { |book| book.title }
    @library.save 'our_new_library.yml'
    library2 = Library.new 'our_new_library.yml'
    books2 = library2.books.map { |book| book.title }
    expect(books).to eq(books2)
  end
end
