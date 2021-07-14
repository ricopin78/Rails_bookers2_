class SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model,@content,@method).page(params[:page]).per(5)
    @book = Book.new
    @user = current_user

  end

  private

    def search_for(model,content,method)
      if model == 'book'
        method == 'partial'
        Book.where('body LIKE ? OR title LIKE ?','%'+content+'%','%'+content+'%')
      else
        method == 'partial'
        User.where('name LIKE ?', '%'+content+'%')
      end
    end
end
