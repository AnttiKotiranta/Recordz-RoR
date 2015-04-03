class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy, :add_records, :add_artists]
  before_action :check_signed_in, except: [:index, :show]

  # GET /bands
  # GET /bands.json
  def index
    @bands = Band.all
  end

  # GET /bands/1
  # GET /bands/1.json
  def show
	@artists = Artist.all
	@records = Record.all
  end

  # GET /bands/new
  def new
    @band = Band.new
  end

  # GET /bands/1/edit
  def edit
  end

  # POST /bands
  # POST /bands.json
  def create
    @band = Band.new(band_params)

    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render action: 'show', status: :created, location: @band }
      else
        format.html { render action: 'new' }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bands/1
  # PATCH/PUT /bands/1.json
  def update
    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  def destroy
    @band.destroy
    respond_to do |format|
      format.html { redirect_to bands_url }
      format.json { head :no_content }
    end
  end

  def add_records
	rec = Record.find(params[:record_id])
	if @band.add_record(rec)
	  redirect_to band_path(@band), notice: 'Record was successfully added.'
	else 
	 redirect_to band_path(@band), notice: 'Failed to add record. Already added?'
	end
  end

  def add_artists
	artist = Artist.find(params[:artist_id])
	if @band.add_artist(artist)
	  redirect_to band_path(@band), notice: 'Artist was successfully added.'
	else 
	 redirect_to band_path(@band), notice: 'Failed to add artist. Already added?'
	end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def band_params
      params.require(:band).permit(:name, :info, :formed, :status)
    end
end
