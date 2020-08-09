Rails.application.routes.draw do
  devise_for :users
  namespace 'api' do
	  namespace 'v1' do
		resources :balances
		get 'balances/:id', to: 'balances#show'
		resources :companies
		get 'companies/:id', to: 'companies#show'
		resources :customers
		get 'customers/:id', to: 'customers#show'	
		post "/customers/:id/buyticket", to: 'customers#buyticket'
		post "/customers/:id/buyticketwithcashback", to: 'customers#buyticketwithcashback'		  
  	end
  end
end
