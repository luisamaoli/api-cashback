class Api::V1::CompaniesController < ApplicationController
    acts_as_token_authentication_handler_for User
 
    before_action :require_authentication!

    include Response

    def index
        company = Company.all
		company_list = company.map { |company| company.slice(:company_name, :ticket_value, :cashback_value) }
        json_response(company_list)
    end

    def show
        company_service = CompanyService::DataAccess
        company = company_service.find_through_id(params[:id])
        customer_service = CustomerService::DataAccess
        customer = customer_service.list_from_company(company)
        customer_data = customer.map { |customer| customer.slice(:customer_name, :numbers_of_ticket) }
        company = { company_id: company.id,
                    company_name: company.company_name,
                    company_ticket_value: company.ticket_value,
                    company_cashback_value: company.cashback_value,
                    customers_purchases: customer_data,
                    updated_at: company.updated_at }
        json_response(company)
        rescue ActiveRecord::RecordNotFound
            render  plain: 'Company is not in the Database',
            status: 404
    end

    private
 
    def require_authentication!
 
        throw(:warden, scope: :user) unless current_user.presence 
    end
end
