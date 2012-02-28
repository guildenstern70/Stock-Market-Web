class TitleController < ApplicationController
  include TitleHelper
  
  def list
    @titles = Title.find(:all)
  end

  def show
    @title = Title.find(params[:id])
  end
  
  def action
    command = params[:commit] 
    if !command.nil?
        @player_money = curplayer.money
        @stocks = find_stocks(params[:stockselect])
        render command.downcase!
    end
  end
  
  def buy
    logger.debug(getplayername() + ' wants to BUY ')
  end

  def sell
    logger.debug(getplayername() + ' wants to SELL ')
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
