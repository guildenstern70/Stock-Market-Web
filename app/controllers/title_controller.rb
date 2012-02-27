class TitleController < ApplicationController
  include TitleHelper
  
  def list
    @titles = Title.find(:all)
    command = params[:commit]
    
     if !command.nil?
        redirect_to :action => command.downcase!, :stocks => params[:stockselect]
     end
    
  end

  def show
    @title = Title.find(params[:id])
  end
  
  def buy
    @stock_ids = params[:stocks]
    @player_money = getcurrentplayer().money
    definestocks
    
    if params[:commit] == 'Buy' # BUY!
        redirect_to :action => 'list'  
    elsif params[:commit] == 'Cancel' 
        redirect_to :action => 'list'  
    end
    
  end

  def sell
    @stock_ids = params[:stocks]
    showstocks
    
    if params[:commit] == 'Sell'# SELL!
        redirect_to :action => 'list'  
    elsif params[:commit] == 'Cancel' 
        redirect_to :action => 'list'  
    end
        
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
