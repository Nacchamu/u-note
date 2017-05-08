class NotesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    article = Article.new(create_params)
    if article.save
      redirect_to notes_path
    else
      render :new
    end
  end

  private
  def create_params
    binding.pry
    params.require(:article).permit(:title, :text, :thumbnail, :tag_list, :category_id).merge(user_id: current_user.id)
  end
end
