class PlaysController < ApplicationController
    before_action :set_play, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
    skip_authorize_resource only: [:upcoming,:archived]
    #before_action :authenticate_user!, only: [:edit, :update, :destroy, :create] #only allow users to edit the DB, anyone can read. Note these routes are only called when someone clicks 'create' (or edit or delete), this doesn't stop the forms from being served

  ##############CUSTOM routes##############
  def upcoming
      @plays = Play.where("date_of_play >= ?",Time.now ).order(date_of_play: :desc )
  end

  def archived
      @plays = Play.where("date_of_play < ?",Time.now ).order(date_of_play: :desc )
  end

  def download_all_pics

  end

  ##############DEFAULT routes##############

  # GET /plays/1
  # GET /plays/1.json
  def show
  end

  # GET /plays/new
  def new
    @play = Play.new
  end

  # GET /plays/1/edit
  def edit
  end

  # POST /plays
  # POST /plays.json
  def create
    @play = Play.new(play_params)

    respond_to do |format|
      if @play.save
        format.html { redirect_to @play, notice: 'Play was successfully created.' }
        format.json { render :show, status: :created, location: @play }
      else
        format.html { render :new }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /plays/1
  # PATCH/PUT /plays/1.json
  def update
    respond_to do |format|
      if @play.update(play_params)
        format.html { redirect_to @play, notice: 'Play was successfully updated.' }
        format.json { render :show, status: :ok, location: @play }
      else
        format.html { render :edit }
        format.json { render json: @play.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plays/1
  # DELETE /plays/1.json
  def destroy
    @play.destroy
    respond_to do |format|
      format.html { redirect_to plays_url, notice: 'Play was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_play
      @play = Play.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def play_params
        params.require(:play).permit(:title, :description, :date_of_play,:profile_image,{:pictures=>[]},:link_to_video ) #weird notation around :pictures needed to permitted nested (array) attributes in this column field. Otherwise will be blocked by the strong_parameters gem
    end

end
