class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ create edit update destroy]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def show
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: "Category was created" }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end

  # require that the associated user is logged in
  def require_admin
    # puts 'LOGGED IN? ' + logged_in?.to_s
    # puts 'ADMIN? ' + current_user.admin?.to_s
    if !(logged_in? && current_user.admin?)
      respond_to do |format|
        format.html { redirect_to categories_path, notice: "You must be an admin to do this." }
        format.json { render json: { errors: ["You must be an admin to do this."] }, status: 403 }
      end
    end
  end
end