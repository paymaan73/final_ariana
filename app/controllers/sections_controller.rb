class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :force_profile

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    premium_user?
    @section = Section.new
    @clubs  = Club.all
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    premium_user?
    @section = Section.new(section_params)
    @club  = Club.find_by(name: params[:section][:club_name])
    @section.club  = @club

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    premium_user?
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    premium_user?
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      if params[:id]
        @section ||= Section.find(params[:id])
      else
        redirect_to root_path, notice: "Not found"
      end
    end

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(:name, :salary)
    end
    def force_profile
        if( current_user && !current_user.profile && current_user.user?)
          redirect_to new_profile_path, notice: "must profile for activity"
        end
    end


end
