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

end
