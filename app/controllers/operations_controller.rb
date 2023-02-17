class OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_group
  before_action :set_operation, only: %i[show edit update destroy]

  def index; end

  def new
    @groups = Group.where(user_id: current_user.id)
    operation = Operation.new
    operation.group_ids = @group.id
    respond_to do |format|
      format.html { render :new, locals: { operation: operation } }
    end  
  end

  def create
    # new object from params
    new_operation = Operation.new(operation_params)
    # new_operation = 
    new_operation.user_id = current_user.id
    # respond_to block
    respond_to do |format|
      format.html do
        # if question saves
        if new_operation.save
          # success message
          flash[:notice] = "Transaction saved successfully"
          # redirect to index
          redirect_to group_path(new_operation.group_ids)
        else
          # error message
          flash.now[:alert] = "Error: transaction could not be saved"
          # render new
          render :new, locals: { operation: operation }
        end
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_operation
    @operation = Operation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def operation_params
    params.require(:new_operation).permit(:name, :amount, group_ids: [])
  end
end
