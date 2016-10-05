Rails.application.routes.draw do
	resources :product_types do
		resources :products
	end
	root 'welcome#index'
end
