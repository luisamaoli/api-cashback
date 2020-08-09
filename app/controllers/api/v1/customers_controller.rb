class Api::V1::CustomersController < ApplicationController
    acts_as_token_authentication_handler_for User
 
    before_action :require_authentication!

    include Response

    def index
        customer = Customer.all
        json_response(customer)
    end

    def show
        customer_service = CustomerService::DataAccess
        customer = customer_service.find_through_id(params[:id])
        company_service = CompanyService::DataAccess
        company = company_service.list_from_customer(customer).map(&:company_name)
        balance_service = BalanceService::DataAccess
        balance = balance_service.find_through_customer(params[:id])
        customer = { customer_id: customer.id,
                    customer_name: customer.customer_name,
                    customer_numbers_of_tickes_each: customer.numbers_of_ticket,
                    company_purchases: company,
                    total_cashback: balance,
                    updated_at: customer.updated_at }
        json_response(customer)
        rescue ActiveRecord::RecordNotFound
            render  plain: 'Custumer is not in the Database',
            status: 404
    end

    def create
        customer = Customer.new(customer_params)
        if customer.save
            json_response(customer)       
        end
    end


    def buyticket
        customer_service = CustomerService::DataAccess
        customer_id = params[:id]
        tickets_number = params[:numero_de_tickets]
        company_service = CompanyService::DataAccess
        company_id = params[:id_company]
        balance_service = BalanceService::DataAccess
        json_response(CustomerService::Operations.buy(customer_service, customer_id, tickets_number, company_service, company_id, balance_service).to_json)
    rescue ActiveRecord::RecordNotFound
        render  plain: 'Custumer is not in the Database',
        status: 404    
    end

    def buyticketwithcashback
        customer_service = CustomerService::DataAccess
        customer_id = params[:id]
        tickets_number = params[:numero_de_tickets]
        company_service = CompanyService::DataAccess
        company_id = params[:id_company]
        balance_service = BalanceService::DataAccess
        json_response(CustomerService::Operations.buy_with_cashback(customer_service, customer_id, tickets_number, company_service, company_id, balance_service).to_json)
    rescue ActiveRecord::RecordNotFound
        render  plain: 'Custumer is not in the Database',
        status: 404  
    end

    private
        
    def customer_params
        params.permit(:customer_name, :numbers_of_ticket)
    end
 
    def require_authentication!
 
        throw(:warden, scope: :user) unless current_user.presence 
    end
end
