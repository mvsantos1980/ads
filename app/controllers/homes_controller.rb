class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # GET /homes
  # GET /homes.json
  def index
    @adsOrderViewAndTitle = Adsense.all.order("view DESC", "title ASC").limit(8)
    @adsLastAdd = Adsense.all.order("created_at DESC").limit(8)
    @adsByCat = nil unless !params[:category_id].blank?
    @adsByCat = Adsense.all.where("category_id = :cat", {cat: params[:category_id]}) unless params[:category_id].blank?
    @catSelect = Category.find params[:category_id] unless params[:category_id].blank?
    @adsFindTitle = nil unless !params[:search_term_title].blank?
    @adsFindTitle = Adsense.all.where("UPPER(adsenses.title) LIKE ?" , "%#{params[:search_term_title].to_s.upcase}%") unless params[:search_term_title].blank?
    @adsFindDesc = nil unless !params[:search_term_description].blank?
    @adsFindDesc = Adsense.all.where("UPPER(adsenses.description) LIKE ?" , "%#{params[:search_term_description].to_s.upcase}%") unless params[:search_term_description].blank?
    @term = params[:search_term_title] unless params[:search_term_title].blank?
    @term = params[:search_term_description] unless params[:search_term_description].blank?
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.fetch(:home, {})
    end
end
