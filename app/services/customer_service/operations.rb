module CustomerService
	class Operations
		class << self
            def buy(customer_service, customer_id, tickets_number, company_service, company_id, balance_service)
                customer = customer_service.find_through_id(customer_id)
                company = company_service.find_through_id(company_id)
                balance = balance_service.find_through_customer(customer_id)
                cash_back_antigo = balance_service.find_cashback(balance)
                valor_total = company.ticket_value * (tickets_number.to_i)
                valor_cashback = valor_total * company.cashback_value + valor_total * 0.01
                cash_back_total = cash_back_antigo+valor_cashback
                balance.update_attributes(cashback_balance: cash_back_total)
                customer = { customer_id: customer.id,
                    customer_name: customer.customer_name,
                    customer_numbers_of_tickes_each: customer.numbers_of_ticket,
                    company_purchases: company,
                    total_cashback: balance,
                    updated_at: customer.updated_at }
                customer
            end

            def buy_with_cashback(customer_service, customer_id, tickets_number, company_service, company_id, balance_service)
                customer = customer_service.find_through_id(customer_id)
                company = company_service.find_through_id(company_id)
                balance = balance_service.find_through_customer(customer_id)
                cash_back_antigo = balance_service.find_cashback(balance)
                valor_total = company.ticket_value * (tickets_number.to_i)
                return successful_purchase(balance, customer, company, cash_back_antigo, valor_total) if cash_back_antigo >= valor_total
                failure_purchase(balance, customer, company)
            end

            private

            def successful_purchase(balance, customer, company, cash_back_antigo, valor_total)
                valor_atualizado_cashback = cash_back_antigo-valor_total
                balance.update_attributes(cashback_balance: valor_atualizado_cashback)
                customer = { 
                            status: "Successful purchase using cashback balance",
                            customer_id: customer.id,
                            customer_name: customer.customer_name,
                            customer_numbers_of_tickes_each: customer.numbers_of_ticket,
                            company_purchases: company,
                            total_cashback: balance,
                            updated_at: customer.updated_at }
                customer
            end
                
            def failure_purchase(balance, customer, company)
                customer = { 
                    status: "Insufficient balance for that cashback purchase",
                    customer_id: customer.id,
                    customer_name: customer.customer_name,
                    customer_numbers_of_tickes_each: customer.numbers_of_ticket,
                    company_purchases: company,
                    total_cashback: balance,
                    updated_at: customer.updated_at }
                customer            
            end
        end
    end
end
