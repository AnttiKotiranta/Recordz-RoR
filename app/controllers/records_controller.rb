class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy, :add_bands, :add_artists, :add_to_collection]
  before_action :check_signed_in, except: [:index, :show]

  # GET /records
  # GET /records.json
  def index
    @records = Record.all
  end

  # GET /records/1
  # GET /records/1.json
  def show
	@bands = Band.all
	@artists = Artist.all
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render action: 'show', status: :created, location: @record }
      else
        format.html { render action: 'new' }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url }
      format.json { head :no_content }
    end
  end
   def add_artists
	artist = Artist.find(params[:artist_id])
	if @record.add_artist(artist)
	  redirect_to record_path(@record), notice: 'Artist was successfully added.'
	else 
	 redirect_to record_path(@record), notice: 'Failed to add artist. Already added?'
	end
  end

  def add_bands
	band = Band.find(params[:band_id])
	if @record.add_band(band)
	  redirect_to record_path(@record), notice: 'Band was successfully added.'
	else 
	 redirect_to record_path(@record), notice: 'Failed to add band. Already added?'
	end
  end
  def add_to_collection
	user = current_user.id
	if @record.add_collector(user)
	  redirect_to record_path(@record), notice: 'Record added to collection.'
	else 
	 redirect_to record_path(@record), notice: 'Already in collection?'
	end
  end
  def remove_from_collection
	user = current_user.id
	
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:name, :info, :year, :performer_id)
    end
end
