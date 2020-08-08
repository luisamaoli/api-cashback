class Api::V1::CustomersController < ApplicationController

    include Response

    def index
        customer = Customer.all
        json_response(customer)
    end

    def show
        customer = Customer.find(params[:id])
        json_response(customer)
    end
end
