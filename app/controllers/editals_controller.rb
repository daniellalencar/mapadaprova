class EditalsController < ApplicationController
  before_action :set_edital, only: [:show, :edit, :update, :destroy]

  # GET /editals
  # GET /editals.json
  def index
    #@editals = Edital.all
  end

  # GET /editals/1
  # GET /editals/1.json
  def show
  end

  def qualquer
  end

  # GET /editals/new
  def new
    @edital = Edital.new
  end

  # GET /editals/1/edit
  def edit
  end

  # POST /editals
  # POST /editals.json
  def create
    @edital = Edital.new(edital_params)

    respond_to do |format|
      if @edital.save
        format.html { redirect_to @edital, notice: 'Edital was successfully created.' }
        format.json { render :show, status: :created, location: @edital }
      else
        format.html { render :new }
        format.json { render json: @edital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /editals/1
  # PATCH/PUT /editals/1.json
  def update
    respond_to do |format|
      if @edital.update(edital_params)
        format.html { redirect_to @edital, notice: 'Edital was successfully updated.' }
        format.json { render :show, status: :ok, location: @edital }
      else
        format.html { render :edit }
        format.json { render json: @edital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /editals/1
  # DELETE /editals/1.json
  def destroy
    @edital.destroy
    respond_to do |format|
      format.html { redirect_to editals_url, notice: 'Edital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edital
      @edital = Edital.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edital_params
      params.fetch(:edital, {})
    end
end
