class Stock < ApplicationRecord

	def self.new_lookup(ticker_symbol)
		client = IEX::Api::Client.new(
                           publishable_token: 'Tpk_3b3894602abc49608cba6e0ff1687e68',                                                 secret_token: 'sk_1fd20e0ad3f64036829da0448052baae',
                                                                  endpoint: 'https://sandbox.iexapis.com/v1')

	begin
        new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
    rescue => exception
        return nil
    end
  end
end
