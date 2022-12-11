class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create

    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save

      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)

    else
      @books = Book.all
      render :index
    end

  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @booknew = Book.new
    @user = current_user
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update

    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save

    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id, :profile_image)
  end

end
