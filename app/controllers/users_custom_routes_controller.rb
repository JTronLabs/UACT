class UsersCustomRoutesController < ApplicationController
  def index
      @approved_users = User.where(:approved=>true)
      @non_approved_users = User.where(:approved=>false)
  end
    
=begin
    # DELETE /user/1
    # DELETE /user/1.json
  def destroy
      @user.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
=end
    
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to people_page_url, notice: "User deleted."
    end
  end
   
    
def approve_user
    @user = User.find(params[:id])
    @user.approved = true
    @user.save
    redirect_to people_page_url, notice: "User approved."
end 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end
