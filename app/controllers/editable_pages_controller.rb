class EditablePagesController < ApplicationController
  before_action :set_editable_page, only: [:show, :edit, :update, :destroy]

    
    def mercury_update_courses
        courses_infos = params[:content]
        courses_infos.each{|course_info|
            label = course_info[0]
            new_val = course_info[1][:value]
            
            id = label.delete("^0-9")
            course = EditablePage.where("id == ?",id).last
            
            if label.index("title") != nil
                course.title = new_val
            elsif label.index("body") != nil
                course.body = new_val
            end
            
            course.save!
        }
        render text: ""
    end
    
    def mercury_update_index
        homepage = EditablePage.find(params[:id])
        homepage.body = params[:content][:homepage_content][:value]
        homepage.save!
        render text: ""
    end
    
    # GET /editable_pages/courses
    def courses
      @courses = EditablePage.where("classification == ?","courses")
    end
    
  # GET /editable_pages
  # GET /editable_pages.json
  def index
    @homepage = EditablePage.where("classification == ?","homepage").last
    #@editable_pages = EditablePage.all
  end

  # GET /editable_pages/1
  # GET /editable_pages/1.json
  def show
  end

  # GET /editable_pages/new
  def new
    @editable_page = EditablePage.new
  end

  # GET /editable_pages/1/edit
  def edit
  end

  # POST /editable_pages
  # POST /editable_pages.json
  def create
    @editable_page = EditablePage.new(editable_page_params)

    respond_to do |format|
      if @editable_page.save
        format.html { redirect_to @editable_page, notice: 'Editable page was successfully created.' }
        format.json { render :show, status: :created, location: @editable_page }
      else
        format.html { render :new }
        format.json { render json: @editable_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editable_pages/1
  # PATCH/PUT /editable_pages/1.json
  def update
    respond_to do |format|
      if @editable_page.update(editable_page_params)
        format.html { redirect_to @editable_page, notice: 'Editable page was successfully updated.' }
        format.json { render :show, status: :ok, location: @editable_page }
      else
        format.html { render :edit }
        format.json { render json: @editable_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editable_pages/1
  # DELETE /editable_pages/1.json
  def destroy
    @editable_page.destroy
    respond_to do |format|
      format.html { redirect_to editable_pages_url, notice: 'Editable page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editable_page
      @editable_page = EditablePage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def editable_page_params
        params.require(:editable_page).permit(:classification,:title,:body)
    end
end
