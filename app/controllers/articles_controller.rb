class ArticlesController < ApplicationController
  def index
    @artigos = Article.all
  end

  def show
    @artigo = Article.find(params[:id])
  end

  def new
    @artigo = Article.new
  end

  def create
    @artigo = Article.new(params_artigo)

    if @artigo.save
      redirect_to @artigo
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @artigo = Article.find(params[:id])
  end

  def update
    @artigo = Article.find(params[:id])

    if @artigo.update(params_artigo)
      redirect_to @artigo
    else
      render :edit, status: :see_other
    end
  end

  def destroy
    @artigo = Article.find(params[:id])
    @artigo.destroy

    redirect_to root_path, status: :see_other
  end

  private 
    def params_artigo
      params.require(:article).permit(:titulo, :corpo)
    end
end
