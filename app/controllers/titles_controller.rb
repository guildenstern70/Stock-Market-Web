class TitlesController < ApplicationController
  include TitlesHelper
  
  def list
    playerid = getplayerid()
    @titles = Title.find(:all,
                         :select => 'titles.id, titles.title, titles.current, titles.previous,  portfolios.quantity, portfolios.cost', 
                         :joins => 'LEFT OUTER JOIN portfolios ON titles.id = title_id AND portfolios.player_id ='+playerid.to_s)
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
    if !qtyarray.nil? && qtyarray.length > 0
        counter = 0
        stocks.each { |stk|
          logger.debug getplayername() + ' buying > ' + qtyarray[counter] + ' ' + stk.title
          counter += 1
        }
        buy_stocks(stocks, qtyarray)
    end
    redirect_to :action => 'list'
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
    redirect_to :action => 'list'  # redirects to Titles/List
  end
end
