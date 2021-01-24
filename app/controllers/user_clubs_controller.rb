class UserClubsController < ApplicationController


  def create

    club_to_add  = Club.find(params[:club_id])

    unless current_user.clubs.include?(club_to_add)

      UserClub.create(club: club_to_add, user: current_user)

      redirect_to root_path, notice: "You have successfully follow in #{club_to_add.name}"

    else

     redirect_to clubs_path, notice: "Something was wrong with apply"

    end

  end

  def destroy

    club  = Club.find(params[:club_id])
    section  = Section.find_by(club: club)

    if current_user.clubs.delete(club) && current_user.sections.delete(section)

      redirect_to clubs_path, notice: "Cancel clubs for you."

    end

  end
end
