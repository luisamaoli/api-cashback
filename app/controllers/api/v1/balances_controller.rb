class Api::V1::BalancesController < ApplicationController
    include Response

    def index
        balance = Balance.all
        json_response(balance)
    end

    def show
        balance = Balance.find_by(params[:customer_id])
        json_response(balance)
    end
end
