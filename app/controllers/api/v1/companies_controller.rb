class Api::V1::CompaniesController < ApplicationController

    include Response

    def index
        company = Company.all
		company_list = company.map { |company| company.slice(:company_name, :ticket_value, :cashback_value) }
        json_response(company_list)
    end
end
