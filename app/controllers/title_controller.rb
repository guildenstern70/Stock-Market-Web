class TitleController < ApplicationController
  def list
      @titles = Title.find(:all)
  end

  def show
      @title = Title.find(:params[:id])
  end

  def create
      
  end

  def edit
  end

  def delete
  end

  def new
  end
  
  def index
    redirect_to :controller => 'title', :action => 'list'  # redirects to Title/List
  end
end
