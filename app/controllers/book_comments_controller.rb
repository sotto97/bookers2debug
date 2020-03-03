class BookCommentsController < ApplicationController
  def create
  	@book = Book.find(params[:book_id])
  	comment = current_user.book_comments.new(book_comment_params) #下2行を省略。.
    # @book_comment = BookComment.new
    # comment.user_id = current_user.id #この2行を省略したものを上に記載している。
    comment.book_id = @book.id
		comment.save
		redirect_to books_path
  end

  def destroy
  	@book_comment = BookComment.find(params[:id])
  	@book_comment.destroy
  	redirect_to book_path(@book.id), notice: "Succesfully deleted comments"
  end
  private
  def book_comment_params
  	params.require(:book_comment).permit(:comment)
  end
end
