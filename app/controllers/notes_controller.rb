class NotesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC")
    @tags = ActsAsTaggableOn::Tag.most_used(7)
  end

  def show
    @article = Article.find(params[:id])
    @fav_count = Favorite.where(article_id: params[:id])
    @yet = Favorite.where(user_id: current_user.id).where(article_id: params[:id])
    @tags = @article.tag_list
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

  def search
    @articles = Article.where('title LIKE(?)',"%#{params[:title]}%").order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def create_params
    params.require(:article).permit(:title, :text, :thumbnail, :tag_list, :category_id).merge(user_id: current_user.id)
  end
end
