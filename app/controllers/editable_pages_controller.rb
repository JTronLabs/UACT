class EditablePagesController < ApplicationController
  before_action :set_editable_page, only: [:show, :edit, :update, :destroy]


    def mercury_update_courses
        params[:content].each{|editable_field|
            css_id_label = editable_field[0]
            new_val = editable_field[1][:value]

            id = css_id_label.delete("^0-9")
            course = EditablePage.where("id = ?",id).last

            if css_id_label.index("title") != nil
                course.title = new_val
            elsif css_id_label.index("body") != nil
                course.body = new_val
            end

            course.save!
        }
        render text: ""
    end

    def mercury_update_index
        params[:content].each{|editable_field|
            css_id_label = editable_field[0]
            new_val = editable_field[1][:value]

            entity = EditablePage.where("classification = ?",css_id_label).last
            entity.body = new_val
            entity.save!
        }
        render text: ""
    end

    # GET /editable_pages/courses
    def courses
      @courses = EditablePage.where("classification = ?","courses")
    end

  # GET /editable_pages
  # GET /editable_pages.json
  def index
      @homepage_content_left = EditablePage.where("classification = ?","homepage_left").last
      @homepage_content_mid = EditablePage.where("classification = ?","homepage_mid").last
      @homepage_content_right = EditablePage.where("classification = ?","homepage_right").last
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
