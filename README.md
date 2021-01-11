# Library-Project - TDD using rspec

The goal of this project was to learn and practice a TDD approach using rspec.
The project involved creating a Book class from which we can instantiate new Book objects.
Each book is instantiated with 3 properties: title, author and category.
I then created a Library class which stores Book objects.
Library objects have the functionality to add new books, retrieve books by title etc.
Each class and method was created bit by bit, using a BDD approach:
* This involves writing at least test specifications BEFORE writing any code.
* Run rspec and see the spec fail.
* Then using that failure to guide what code we need to write, in order to get the test to pass.
* Once the test is passing, write a new spec and get that one to pass, and so on.

## Getting started

* To clone this repository: `git@github.com:AJ8GH/library-tdd-project.git`
* Requirements: ruby ~> 2.7.0, rspec ~> 3.3.0
* To install rspec: `gem install rspec`
* For rspec help: `rspec --help`

## Running tests

* Navigate to the main project directory and run `rspec` to run all specs
* To run specific spec files: `rspec spec/<spec_file_name>`
* e.g. `rspec spec/book_spec.rb` to run only the tests for book.rb
* To see tests ouput in more readable format, suffix with the flag `-fd`
