class AlbumsController < ApplicationController
  def index
    @albums = Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
      format.js {render :layout => false}
    end
  end

  def recentResponses
    #@albums = Album.all
    @images = Image.order('responded_at DESC').all(:limit => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
      format.js {render :layout => false}
    end
  end

  def popular
    #@albums = Album.all
    @images = Image.order('votes_count DESC').all(:limit => 50)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @albums }
      format.js {render :layout => false}
    end
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @album = Album.find(params[:id])
    @images = @album.images
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @album, json: @images }
      format.js {render :layout => false}
    end
  end

  # GET /albums/new
  # GET /albums/new.json
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.json
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
end

