class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      # リダイレクトと同時に”Book was successfully created.”を表示。
      flash[:notice] = 'Book was successfully created.'
      redirect_to show_book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to show_book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy #destroyメソッドを使用し対象のツイートを削除する。
  # リダイレクトと同時に'Book was successfully destroyed'を表示。
   flash[:notice] = 'Book was successfully destroyed.'
   redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
