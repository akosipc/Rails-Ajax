class ArtistsController < ApplicationController
	def index
		@artists = Artist.all
		@artist = Artist.new

		respond_to do |format|
			format.html
			format.json { render json: @artists }
		end
	end

	def show
		@showartist = Artist.find(params[:id])
		respond_to do |format|
			format.html
			format.js
		end
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def create
		@artist = Artist.new(params[:artist])
		respond_to do |format|
			if @artist.save
				@artists = Array(Artist.last)
				format.js
			else
				render 'new'
			end
		end
	end

	def update
		@artist = Artist.find(params[:id])
		if @artist.update_attributes(params[:artist])
			redirect_to artist_path(@artist.id)
		else
			render 'edit'
		end
	end
end
