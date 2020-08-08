Rails.application.routes.draw do
  namespace 'api' do
	  namespace 'v1' do
		resources :balances
		resources :companies
		resources :customers		  
  	end
  end
end
