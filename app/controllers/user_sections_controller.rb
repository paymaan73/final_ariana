class UserSectionsController < ApplicationController


  def create

    section_to_add = Section.find(params[:section_id])

    unless current_user.sections.include?(section_to_add)

      UserSection.create(section: section_to_add, user: current_user)
      redirect_to root_path, notice: "You have successfully apply in #{section_to_add.name}"

    else

      redirect_to clubs_path, notice: "Something was wrong with your apply"

    end
  end


  def destroy
    section   = Section.find(params[:section_id])
    if current_user.sections.delete(section)
      redirect_to root_path, notice: "Existing section."
    end
  end

end
