class BookCommentsController < ApplicationController

  def create
    book= Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    if comment.save
      redirect_back(fallback_location: root_path)

    else
      @book = Book.find(params[:book_id])
      @bookuser = @book.user
      @user = current_user
      @newbook = Book.new
      @book_comment = BookComment.new
      @error_comment = comment
      render 'books/show'
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
