class ProductsController < ApplicationController
	def create
		@product_type = ProductType.find(params[:product_type_id])
		@product = @product_type.products.create(product_params)
		redirect_to product_type_path(@product_type)
	end
 
 	private
		def product_params
			params.require(:product).permit(:title)
		end
end
