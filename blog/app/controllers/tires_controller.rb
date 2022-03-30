class TiresController < ApplicationController
  before_action :set_tire, only: %i[ show edit update destroy ]

  # GET /tires or /tires.json
  def index
    @tires = Tire.all
  end

  # GET /tires/1 or /tires/1.json
  def show
  end

  # GET /tires/new
  def new
    @tire = Tire.new
  end

  # GET /tires/1/edit
  def edit
  end

  # POST /tires or /tires.json
  def create
    @tire = Tire.new(tire_params)

    respond_to do |format|
      if @tire.save
        format.html { redirect_to tire_url(@tire), notice: "Tire was successfully created." }
        format.json { render :show, status: :created, location: @tire }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tires/1 or /tires/1.json
  def update
    respond_to do |format|
      if @tire.update(tire_params)
        format.html { redirect_to tire_url(@tire), notice: "Tire was successfully updated." }
        format.json { render :show, status: :ok, location: @tire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tires/1 or /tires/1.json
  def destroy
    @tire.destroy

    respond_to do |format|
      format.html { redirect_to tires_url, notice: "Tire was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tire
      @tire = Tire.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tire_params
      params.require(:tire).permit(:make, :model, :size, :description)
    end
end
