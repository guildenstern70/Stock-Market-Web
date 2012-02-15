class TitleController < ApplicationController
  def list
    @titles = Title.find(:all)
    
    if params[:commit] == 'Sell'
        sellstock = params[:stockselect]
        if !sellstock.nil?
          redirect_to :action => 'sell', :stocks => sellstock
        end
    elsif params[:commit] == 'Buy'
        # B was pressed
    end
    
  end

  def show
    @title = Title.find(params[:id])
  end

  def sell
    @stocks = params[:stocks]
    logger.debug("Il giocatore #{getplayername()} vuole vendere #{@stock}")
    
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
