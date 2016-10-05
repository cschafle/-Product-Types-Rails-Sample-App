class ProductTypesController < ApplicationController
	helper_method :sort_column, :sort_direction
	def index
		@product_types = ProductType.order(sort_column + ' ' + sort_direction)
	end

	def show
		@product_type = ProductType.find(params[:id])
	end

	def new
		@product_type = ProductType.new
	end

	def edit
		@product_type = ProductType.find(params[:id])
	end

	def create
		@product_type = ProductType.new(product_type_params)
		@product_type.created = DateTime.now;
		if @product_type.save
			redirect_to @product_type
		else
			render 'new'
		end
	end

	def update
		@product_type = ProductType.find(params[:id])

		if @product_type.update(product_type_params)
			redirect_to @product_type
		else
			render 'edit'
		end
	end

	private
		def product_type_params
			params.require(:product_type).permit(:title)
		end

		def sort_column
		  ProductType.column_names.include?(params[:sort]) ? params[:sort] : "title" 
		end

		def sort_direction
		  %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
		end
end
