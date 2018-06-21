class AdsensesController < ApplicationController
  before_action :set_adsense, only: [:show, :edit, :update, :destroy]

  # GET /adsenses
  # GET /adsenses.json
  def index
    @adsenses = Adsense.all
  end

  # GET /adsenses/1
  # GET /adsenses/1.json
  def show
  end

  # GET /adsenses/new
  def new
    @adsense = Adsense.new
  end

  # GET /adsenses/1/edit
  def edit
  end

  # POST /adsenses
  # POST /adsenses.json
  def create
    @adsense = Adsense.new(adsense_params)

    respond_to do |format|
      if @adsense.save
        format.html { redirect_to @adsense, notice: 'Adsense was successfully created.' }
        format.json { render :show, status: :created, location: @adsense }
      else
        format.html { render :new }
        format.json { render json: @adsense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adsenses/1
  # PATCH/PUT /adsenses/1.json
  def update
    respond_to do |format|
      if @adsense.update(adsense_params)
        format.html { redirect_to @adsense, notice: 'Adsense was successfully updated.' }
        format.json { render :show, status: :ok, location: @adsense }
      else
        format.html { render :edit }
        format.json { render json: @adsense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adsenses/1
  # DELETE /adsenses/1.json
  def destroy
    @adsense.destroy
    respond_to do |format|
      format.html { redirect_to adsenses_url, notice: 'Adsense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adsense
      @adsense = Adsense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adsense_params
      params.require(:adsense).permit(:title, :description, :price)
    end
end
