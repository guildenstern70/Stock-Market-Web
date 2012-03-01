module TitleHelper
  
  def find_stocks(stock_ids)
    stocks = Array.new
    if (!stock_ids.nil?) and (stock_ids.length > 0)
      stock_ids.each { |stock_id|
        stocks.push Title.find(stock_id)
      }
    end
    return stocks
  end
  
  def buy_stocks(stocks, quantities)
    player = getcurrentplayer()
    counter = 0
    stocks.each { |stock|
      
      player.portfolios.create( :title => stock, :quantity => quantities[counter] )
      counter += 1
    }
  end

end
