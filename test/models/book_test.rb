require "test_helper"

describe Book do
  # let(:book) { Book.new }
  #
  # it "must be valid" do
  #   value(book).must_be :valid?
  # end

  # change to use yml file in fixture: 
  let :author {Author.first}

  let :title {"test book title"}
  describe 'validations' do
    # this is the positive test:
    it 'can be created with all fields' do
      a = Author.create!
      b = Book.new(author: a, title: "test book")
      b.must_be :valid?
    end

    # all for title: #########################
    # this is the negative test
    it 'requires a title' do
      b = Book.new
      is_valid = b.valid?
      is_valid.must_equal false
      b.errors.messages.must_include :title
    end
    it 'requires a new title' do
      title = "test book"
      b1 = Book.create!(title: title, author: author)
      b2 = Book.new(title: title, author: author)
      b2.wont_be :valid?
    end

    # all for description: ###################
    # think about what would happen if exactly 500 characters

    # this is the positive test:
    it "description is acceptable length (<500)" do
      descriptions = [
        "I am less than 500 characters",
        "a" * 500,
        "a" * 10,
        "a" * 0]
        descriptions.each do |desc|
          b = Book.new(title: title, author: author, description: desc)

          b.must_be :valid?
        end
      end
      # this is the negative test:
      it "desciption will be invalid if over 500 characters" do
        description = "a" * 501
        b = Book.new(title: title, author: author, description: description)
        b.wont_be :valid?
        b.errors.messages.must_include :description
      end
    end

    describe 'relations' do

      # this is a positive test
      it "has an author" do
        b = Book.new(author: author)
        b.must_respond_to :author
        b.author.must_equal author
        b.author_id.must_equal author.id
      end
      # positive test using fixture data
      it "has an author using fixtures " do
        b = books(:poodr)
        a = authors(:metz)
        b.must_respond_to :author
        b.author.must_equal a
        b.author_id.must_equal a.id
      end

      # this is a positive test
      it "has a collection of genres" do
        b = Book.new
        b.must_respond_to :genres
        b.genres.must_be :empty?

        g = Genre.create!(name: "test genre")
        b.genres << g
        b.genres.must_include g
      end

    end

    describe 'age' do

    end

  end
