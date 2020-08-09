module BalanceService
    class DataAccess
      attr_reader :balance
    
        def self.find_through_customer(customer_id)
            @balance = Balance.find_by(customer_id: customer_id)
        end

        def self.find_cashback(balance)
            @cashback = balance.cashback_balance
        end
    end 
end