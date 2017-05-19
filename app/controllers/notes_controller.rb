class NotesController < ApplicationController
  impressionist actions: [:show]
  def index
    @articles = Article.all.order("created_at DESC")
    @slidepics = Article.last(3)
    @tags = ActsAsTaggableOn::Tag.most_used(7)
    @rank = Article.find(Impression.group(:impressionable_id).order('count_all desc').limit(5).count.keys)
  end

  def show
    @article = Article.find(params[:id])
    @fav_count = Favorite.where(article_id: params[:id])
    @impressions = Impression.where(impressionable_id: params[:id])
    @yet = Favorite.where(user_id: current_user.id).where(article_id: params[:id]) if user_signed_in?
    @tags = @article.tag_list
  end

  def new
    @article = Article.new
    @categories = Category.all
    @tags = ActsAsTaggableOn::Tag.most_used(7)
  end

  def create
    article = Article.new(create_params)
    if article.save
      redirect_to notes_path
    else
      redirect_to new_note_path
    end
  end

  def search
    @articles = Article.where('title LIKE(?)',"%#{params[:title]}%").order("created_at DESC")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def category_search
    @articles = Article.where(category_id: params[:id]).order("created_at DESC")
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
