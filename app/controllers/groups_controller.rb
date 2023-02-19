class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    # @categories = Group.where(user_id: current_user.id).includes(:operations, icon_attachment: [:blob])
    @categories = current_user.groups
  end

  def show
    @category = Group.find(params[:id])
    @operations = @category.operations
  end

  def new
    categorie = Group.new
    respond_to do |format|
      format.html { render :new, locals: { categorie: } }
    end
  end

  def create
    # new object from params
    new_categorie = Group.new(params.require(:new_categorie).permit(:name, :icon))
    # new_categorie =
    new_categorie.user_id = current_user.id
    # respond_to block
    respond_to do |format|
      format.html do
        # if question saves
        if new_categorie.save
          # success message
          flash[:notice] = 'Categorie saved successfully'
          # redirect to index
          redirect_to groups_path
        else
          # error message
          flash.now[:alert] = 'Error: Categorie could not be saved'
          # render new
          render :new, locals: { categorie: }
        end
      end
    end
  end
end
