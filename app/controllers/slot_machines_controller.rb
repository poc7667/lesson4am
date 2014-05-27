class SlotMachinesController < ApplicationController
  before_action :set_slot_machine, only: [:show, :edit, :update, :destroy]

  # GET /slot_machines
  # GET /slot_machines.json
  def index
    @slot_machines = SlotMachine.all
  end

  # GET /slot_machines/1
  # GET /slot_machines/1.json
  def show
  end

  # GET /slot_machines/new
  def new
    @slot_machine = SlotMachine.new
  end

  # GET /slot_machines/1/edit
  def edit
  end

  # POST /slot_machines
  # POST /slot_machines.json
  def create
    @slot_machine = SlotMachine.new(slot_machine_params)

    respond_to do |format|
      if @slot_machine.save
        format.html { redirect_to @slot_machine, notice: 'Slot machine was successfully created.' }
        format.json { render :show, status: :created, location: @slot_machine }
      else
        format.html { render :new }
        format.json { render json: @slot_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slot_machines/1
  # PATCH/PUT /slot_machines/1.json
  def update
    respond_to do |format|
      if @slot_machine.update(slot_machine_params)
        format.html { redirect_to @slot_machine, notice: 'Slot machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @slot_machine }
      else
        format.html { render :edit }
        format.json { render json: @slot_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slot_machines/1
  # DELETE /slot_machines/1.json
  def destroy
    @slot_machine.destroy
    respond_to do |format|
      format.html { redirect_to slot_machines_url, notice: 'Slot machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slot_machine
      @slot_machine = SlotMachine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slot_machine_params
      params.require(:slot_machine).permit(:name, :description)
    end
end
