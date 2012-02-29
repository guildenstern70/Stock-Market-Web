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
        curplayer = getcurrentplayer()
        @player_money = curplayer.money
        @stocks = find_stocks(params[:stockselect])
        render command.downcase!
    end
  end
  
  def buy
    qtyarray = params[:buyqty]
    stocks = find_stocks(params[:id])
    logger.debug 'BUY CONTROLLER: ' + stocks.to_s
    if !qtyarray.nil? && qtyarray.length > 0
        logger.debug getplayername() + ' wants to BUY ' + qtyarray.length.to_s + ' stocks'
        counter = 0
        stocks.each { |stk|
          logger.debug getplayername() + ' buying > ' + qtyarray[counter] + ' ' + stk.title
          counter += 1
        }
    end  
    redirect_to '/title/list'
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
