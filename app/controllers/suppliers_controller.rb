class SuppliersController < ApplicationController
  before_action :require_user
  before_action :require_admin
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all.order("name").paginate(page: params[:page], per_page: 5)
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      flash[:success] = "Supplier was successfully created"
      redirect_to suppliers_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    if @supplier.update(supplier_params)
      flash[:success] = "Supplier was successfully updated"
      redirect_to suppliers_path
    else
      render 'edit'
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # :name, :address, :web, :email, :tel, :tin, :fax, :representative
    def supplier_params
      params.require(:supplier).permit(:name, :address, :web, :email, :tel, :tin, :fax, :representative)
    end
end
