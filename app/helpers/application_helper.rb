module ApplicationHelper
  def root?
    unless current_user && current_user.admin?
        redirect_to root_path
    end

  end
    def premium_user?
        unless current_user && (current_user.admin? || current_user.master?)
          redirect_to root_path
        end
    end
end
