class AlbumsController < ApplicationController
	before_filter :load
	def load
		@albums = Album.find(:all, :conditions => ["artist_id = (?)", params[:artist_id]])
	end

	def index
		@albums = Album.find(:all, :conditions => ["artist_id = (?)", params[:artist_id]])
	end

	def show
		@album = Album.find(params[:id])
	end

	def new
		@artist = Artist.find(params[:artist_id])
		@album = @artist.albums.build
		respond_to do |format|
			format.js
		end
	end

	def edit
		@album = Album.find(params[:id])
	end

	def create
		@artist = Artist.find(params[:artist_id])
		@album = @artist.albums.build(params[:album])
		@showartist = Artist.find(params[:artist_id])
		respond_to do |format|
			if @album.save
				flash[:notice] = "Added a new album"
				@albums = @artist.albums.all
				format.js
			else
				render 'new'
			end	
		end
	end

	def update

	end
end
