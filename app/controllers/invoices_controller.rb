class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :signed_in?, only: [:new, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :build_lists, only: [:new, :edit]

  # GET /invoices
  def index
    @user = current_user.email.upcase
    if @user == 'ADMIN'
      @invoices = Invoice.all
    else
      @invoices = Invoice.where(owner: @user)
    end
  end

  # GET /invoices/1
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    6.times { @invoice.issues.build }
    6.times { @invoice.parts.build }
  end

  # GET /invoices/1/edit
  def edit
    @invoice.issues.build
    @invoice.parts.build
  end

  # POST /invoices
  def create
    @user = current_user.email.upcase
    @invoice = Invoice.new(invoice_params)
    @invoice.owner = @user
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
      else
        flash[:error] = @invoice.errors.full_messages.first
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /invoices/1
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
      else
        flash[:error] = @invoice.errors.full_messages.first
        format.html { render :edit }
      end
    end
  end

  # DELETE /invoices/1
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
      session[:invoice_id] = @invoice.id
    end

    def signed_in?
      unless current_user
        redirect_to invoices_path, :alert => "Access denied."
      end
    end

    def authorize_user!
      @user = current_user.email.upcase
      unless @user == @invoice.owner || @user == 'ADMIN'
        redirect_to team_path(id: @invoice.id), :alert => "Access denied."
      end
    end
    def build_lists
      @category = ['OPERATIONS', 'PURCHASING', 'QUALITY', 'SALES']
      @issue = ['WRONG ITEM','SHORT DATE', 'LOADING ERROR', 'LESS THAN ORDERED', 'MORE THAN ORDERED', 'LATE DELIVERY','MORE THAN ORDER','LESS THAN ORDER', 'HIGH TEMPERATURE', 'LOW TEMPERATURE', 'MORE THAN ORDERED', 'INCORRECT CUT','PRODUCT APPEARANCE','BLOOD SHOT', 'BRUISING', 'BROKEN BONES', 'EXPIRED BEFORE DATE', 'EXCESS PURGE', 'DISCOLORATION', 'FOREIGN MATERIAL - BONE', 'FOREIGN MATERIAL - TUMOR', 'FOREIGN MATERIAL - PELLET', 'FOREIGN MATERIAL - OTHER', 'PACKAGING - LOOSE/BLOWN', 'PACKAGING - LEAK', 'PACKAGING - MISLABLED', 'TEXTURE', 'LOT TO LOT VARIATION', 'COOK UP ISSUE', 'MARBLING', 'CUSTOMER ORDERED WRONG PRODUCT', 'ORDER ENTRY ERROR', 'CUSTOMER ACCOMODATION', 'PRICING ISSUE', 'CREDIT ISSUE']
    end

        # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(
        :invoice_number, :issue_date, :owner,
        parts_attributes: [
          :id,
          :part_code,
          :qty_returned
        ],
        issues_attributes: [
          :id,
          :category,
          :issue
        ]
      )
    end
end
