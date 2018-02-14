class ArticlesController < ApplicationController
require 'digest'
  before_action :authenticate_user!, only: [:show, :new, :edit, :update ,:destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.text_hash = Digest::SHA256.hexdigest @article.text
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

 def update
    @article = Article.find(params[:id])
    @article.text_hash = Digest::SHA256.hexdigest article_params[:text]
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
