class ArtistsController < ApplicationController
	before_filter :load

	def load
		@artists = Artist.all
	end
	
	def index
		@artists = Artist.all
		@artist = Artist.new

		respond_to do |format|
			format.html
			format.json
			format.js
		end
	end

	def show
		@showartist = Artist.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def edit
		@artist = Artist.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def create
		@artist = Artist.new(params[:artist])
		respond_to do |format|
			if @artist.save
				@artists = Artist.all
				flash[:notice] = "Successfully created this artist"
				format.js
			else
				render 'new'
			end
		end
	end

	def update
		@artist = Artist.find(params[:id])
		respond_to do |format|
			if @artist.update_attributes(params[:artist])
				flash[:notice] = "Successfully updated this artist"
				format.js
			else
				render 'edit'
			end
		end		
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy

		respond_to do |format|
			@artists = Artist.all
			flash[:notice] = "Successfully deleted this artist"
			format.js
		end
	end
end

