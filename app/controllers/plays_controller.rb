class PlaysController < ApplicationController
  before_action :set_play, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource 
    #before_action :authenticate_user!, only: [:edit, :update, :destroy, :create] #only allow users to edit the DB, anyone can read. Note these routes are only called when someone clicks 'create' (or edit or delete), this doesn't stop the forms from being served

  # GET /plays
  # GET /plays.json
  def index
      @plays = Play.all.order(date_of_play: :desc )
  end

  # GET /plays/1
  # GET /plays/1.json
  def show
  end

  # GET /plays/new
  def new
    @play = Play.new
    @users = User.where( approved:true, graduation_year:(Time.now.year - 4)..(Time.now.year + 4) )
  end

  # GET /plays/1/edit
  def edit
    #find all the previous user associations with this play
    @prev_users = Hash.new
    WorksOn.where(play_id: @play.id).each do |association|
        @prev_users[association.user_id] = association.student_role #get all the data associated with that user (currently only student role)
    end
      
    @users = User.where( approved:true, graduation_year:(Time.now.year - 4)..(Time.now.year + 4) )
      @users.merge(@prev_users.to_a) # include previous users with the users shown, thus even if the users graduated 5+ years ago they won't be hidden on the update page
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
      
      
      associate_play_with_users(params) #must associate with users after play is created and saved (and therefore has an id)
  end

  # PATCH/PUT /plays/1
  # PATCH/PUT /plays/1.json
  def update
    associate_play_with_users( params )
      
      
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
        params.require(:play).permit(:title, :description, :date_of_play,:profile_image,{:pictures=>[]} ) #weird notation aroudn :pictures needed to permitted nested (array) attributes in this column field. Otherwise will be blocked by the strong_parameters gem
    end
    
    def associate_play_with_users( params )
        user_ids  = params[:user_id] #grab user_id hash from params
        user_roles = params[:user_role]
        user_ids = user_ids[:user_ids] #select the :user_ids key's values from the hash
        user_ids = user_ids.select{|id|id.length!=0}#rails includes hidden empty string field for checkboxes, must filter it out by removing the 0 length string
        
      WorksOn.where(:play_id=>@play.id).destroy_all #remove previous associations
        user_ids.each do |user_id| #only create relations to items selected in checkbox
            WorksOn.create(:play_id=>@play.id, :student_role => user_roles[user_id],:user_id=>user_id) #create new associations to user   
      end        
    end
end
