class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:machine_id])
    @machine_snacks = @machine.snack
  end
end
