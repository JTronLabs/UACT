class UsersCustomRoutesController < ApplicationController
  def index
      @approved_users = User.where(:approved=>true)
      @non_approved_users = User.where(:approved=>false)
  end
end
