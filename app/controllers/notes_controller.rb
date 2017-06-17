class NotesController < ApplicationController
  # impressionist actions: [:show]
  def index
    @articles = Article.includes(:user).all.order("created_at DESC")
    @slidepics = Article.last(3)
    @tags = ActsAsTaggableOn::Tag.most_used(7)
    # @rank = Article.find(Impression.group(:impressionable_id).order('count_all desc').limit(5).count.keys)

    # その日のランキング作成アルゴリズム部分
    daily_pageviews = Hash.new
    today = Date.today.to_s
    @articles.each do |article|
      daily_pageviews[article.id] = REDIS.get "posts/daily/#{today}/#{article.id}"
    end
    daily_pageviews_ranking = daily_pageviews.sort{|a, b| b[1] <=> a[1]}
    top3_articles = daily_pageviews_ranking[0..4]
    @rank = []
    top3_articles.each{|key,val|
      @rank << Article.find(key)
    }
  end

  def show
    @article = Article.includes(:user).find(params[:id])
    @fav_count = Favorite.where(article_id: params[:id])
    # @impressions = Impression.where(impressionable_id: params[:id])
    @fav_yet = Favorite.where(user_id: current_user.id).where(article_id: params[:id]) if user_signed_in?
    @tags = @article.tag_list

    # ビュー数をカウントします
    REDIS.incr "posts/daily/#{Date.today.to_s}/#{@article.id}"

    # 各記事のビュー数を表示します
    view_counts = 0
    selected_articles = REDIS.keys "*/#{@article.id}*"
    selected_articles.each do |selected_article|
       view_count = REDIS.get "#{selected_article}"
       view_counts += view_count.to_i
    end
    @view_counts = view_counts
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
