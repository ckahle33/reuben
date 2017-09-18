class SectionsController < ApplicationController
  helper_method :width_options

  def index
    @sections = Section.where(article_id: params[:article_id])

    respond_to do |format|
      format.json { render json: { sections: @sections } }
    end
  end

  def new
    @section = Section.new
    @article = Article.find(params[:article_id])
  end

  def show
    @section = Section.find(params[:id])
  end

  def create
    @section = Section.create(section_params.merge(article_id: params[:article_id]))
    if @section.save!
      redirect_to article_path(@section.article)
      flash[:notice] = "Section Saved!"
    else
      redirect_to article_path(@section.article)
      flash[:notice] = "Section couldn't be saved!"
    end
  end

  def edit
  end

  def update
    @section = Section.find(params[:id])

    if @section.update_attributes(section_params)
      flash[:success] = "Section updated!"
      redirect_to edit_article_path(params[:article_id])
    else
      redirect_to edit_article_path(params[:article_id])
    end
  end

  def order
    render json: {params: params}
    sections = params['sections']
    Section.update(sections.keys, sections.values)
  end

  def section_params
    params.require(:section).permit!
  end

end
