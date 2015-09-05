module Mercury
  module Authentication

    def can_edit?
        if user_signed_in? and current_user.role == 'admin'
            true
        else
            #flash[:notice] = "You are not authorized to view that page."
            redirect_to root_path, notice:"You are not authorized to view that page."
        end
    end

  end
end
