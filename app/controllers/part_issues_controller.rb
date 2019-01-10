class PartIssuesController < ApplicationController
  before_action :set_part_issue, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user.email.upcase
    if @user == 'ADMIN'
      @part_issues = PartIssue.all
    else
      @part_issues = PartIssue.where(owner: @user)
    end
  end

  # GET /part_issues/1
  def show
    @invoice = Invoice.find(current_invoice)
    @part_issue = PartIssue.find(params[:id])
  end

  # GET /part_issues/new
  def new
    @part_issue = PartIssue.new
    @invoice = Invoice.find(current_invoice)
    if session[:part_id] != 0
      @part = Part.find(current_part)
    end
    if session[:issue_id] != 0
      @issue = Issue.find(current_issue)
    end
    @parts = @invoice.parts.all
    @issues = @invoice.issues.all
  end

  # GET /part_issues/1/edit
  def edit
  end

  # POST /part_issues
  def create
    @part_issue = PartIssue.new(part_issue_params)

    respond_to do |format|
      if @part_issue.save
        @invoice = current_invoice
        format.html { redirect_to @part_issue, notice: 'Part issue was successfully created.' }
      else
        flash[:error] = @part_issue.errors.full_messages.first
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /part_issues/1
  def update
    respond_to do |format|
      if @part_issue.update(part_issue_params)
        format.html { redirect_to @part_issue, notice: 'Part issue was successfully updated.' }
      else
        flash[:error] = @part_issue.errors.full_messages.first
        format.html { render :edit }
      end
    end
  end

  # DELETE /part_issues/1
  def destroy
    @part_issue.destroy
    respond_to do |format|
      format.html { redirect_to part_issues_url, notice: 'Part issue was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_issue
      @part_issue = PartIssue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_issue_params
      params.require(:part_issue).permit(:pictures, :notes, :part_id, :issue_id)
    end
end
