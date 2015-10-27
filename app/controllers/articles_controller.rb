class ArticlesController < ApplicationController

  def index         # GET /articles
    @articles = Article.all
  end

  def show          # GET /articles/:id
    @article = Article.find(params[:id])
  end

  def new           # GET /articles/new
    @article = Article.new
  end

  def create        # POST /articles
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit          # GET /articles/:id/edit
    @article = Article.find(params[:id])
  end

  def update        # PATCH /articles/:id
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy       # DELETE /articles/:id
    @article = Article.find(params[:id])
    @article.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to articles_path
  end

  private

  def article_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:article).permit(:title, :content)
  end
end
