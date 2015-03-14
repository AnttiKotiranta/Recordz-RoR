class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy, :add_bands]
  before_action :check_signedin, only: [:new, :edit, :update, :destroy]

  # GET /artists
  # GET /artists.json
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
	@bands = Band.all 
	@records = Record.all
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(artist_params)
    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @artist }
      else
        format.html { render action: 'new' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artists/1
  # PATCH/PUT /artists/1.json
  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end
 def add_bands
	band = Band.find(params[:band_id])
	if @artist.add_band(band)
	  redirect_to artist_path(@artist), notice: 'Band was successfully added.'
	else 
	 render action: 'artist', notice: 'Failed to add band.'
	end
 end
  def add_records
	perf = Performer.find(params[:performer_id])
	if @artist.add_record(perf)
	  redirect_to artist_path(@artist), notice: 'Record was successfully added.'
	else 
	 render action: 'artist', notice: 'Failed to add record.'
	end
 end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artist_params
      params.require(:artist).permit(:name, :info)
    end
    def set_artists_and_bands
	@artists=Artist.all
	@bands=Band.all
    end
	
    def check_signedin
	if not current_user
	redirect_to 'signin', notice: 'You should be logged in'
	end
    end
end
