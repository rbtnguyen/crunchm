class ProductsController < ApplicationController
	def index
	end

	def new
		@product = Product.new
	end
	# # ????delete index?????
	# def index
	# 	@comparison = Comparison.find(params[:id])
	# 	@products = Product.where(comparison_id: params[:id])
	# end

	# # ????delete new?????
	# def new
	# 	@comparison = Comparison.new
	# 	@product = Product.new
	# end

	# add 3+ products
	def create
		@comparison = current_comparison
		@user = current_user
		# @products_hash = ??? how do we bring this??
        # @tributes_all_hash 
		# @comparison = Comparison.new(comparison_params)
		# crunchm(current_comparison, @product, raw_link, products_hash, tributes_all_hash)

		#!!!!!!!!!!!!!!! note: we need to change this to if parsed, not if saved
		# if @comparison.update
				url_new = params[:product][:url]		
				puts 'the new url is:::::::::::::::::::::::::::::::::::::::::::::::::'
				puts url_new
				@product = Product.create(url: url_new)
				# @products_hash =  eval(params[:product][:products][:products_hash])
				# puts "products hash keys are :"
				# puts @products_hash.keys
				# @tributes_all_hash = Hash[*@products_hash[:tributes_all_hash].flatten]
				@crunchm = crunchm(@comparison, @product, url_new)
				@comparison.products.push(@product)
				# @comparison.tributes.push()
			puts "SUCCESSFUL NEW PRODUCT"
		# else
		# 	puts @comparison.errors.full_messages
		# end
		redirect_to edit_comparison_path(@comparison)
	end

	# ranking updated, price change 
	def update
	end	

	# delete this product from the table
	def destroy
		puts "reached the product destroy action<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
		puts "reached the product destroy action<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
		puts "reached the product destroy action<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
		puts "reached the product destroy action<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
		@product = Product.find(params[:id])
		@product.destroy

		respond_to do |format|
			format.html { redirect_to(edit_comparison_path)}
			format.js	{ render nothing: true }
		end	
	end	


	


end
