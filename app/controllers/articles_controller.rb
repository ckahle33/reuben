class ArticlesController < ApplicationController
  helper_method :order_options

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(article_params)
        format.html {
          flash[:success] = "Article updated!"
          redirect_to root_path
        }
        format.json { render json: { message: "Article updated!" }}
      else
        format_html { redirect_to 'edit' }
        format.json { render json: { message: @article.errors }}
      end
    end

  end

  def create
    @article = Article.create(article_params)
    if @article.save!
      redirect_to articles_path
    else
      flash[:notice] = "Couldn't save!"
    end
  end

  def article_params
    params.require(:article).permit!
  end


  def order_options
    @article = Article.find(params[:id])
    [*1..@article.sections.count]
  end


end

