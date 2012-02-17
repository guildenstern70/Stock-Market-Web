module TitleHelper
  
  def definestocks()

    if (!@stock_ids.nil?) and (@stock_ids.length > 0)

      @stocks = Array.new
      @stock_ids.each { |stock_id|
        @stocks.push Title.find(stock_id)
      }
      logger.debug("Il giocatore #{getplayername()} vuole vendere #{@stocks}")

    end

  end

end
