class PartIssuesController < ApplicationController
  before_action :set_part_issue, only: [:show, :edit, :update, :destroy]

  # GET /part_issues
  # GET /part_issues.json
  def index
    @part_issues = PartIssue.all
  end

  # GET /part_issues/1
  # GET /part_issues/1.json
  def show
  end

  # GET /part_issues/new
  def new
    @part_issue = PartIssue.new
  end

  # GET /part_issues/1/edit
  def edit
  end

  # POST /part_issues
  # POST /part_issues.json
  def create
    @part_issue = PartIssue.new(part_issue_params)

    respond_to do |format|
      if @part_issue.save
        format.html { redirect_to @part_issue, notice: 'Part issue was successfully created.' }
        format.json { render :show, status: :created, location: @part_issue }
      else
        format.html { render :new }
        format.json { render json: @part_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_issues/1
  # PATCH/PUT /part_issues/1.json
  def update
    respond_to do |format|
      if @part_issue.update(part_issue_params)
        format.html { redirect_to @part_issue, notice: 'Part issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_issue }
      else
        format.html { render :edit }
        format.json { render json: @part_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_issues/1
  # DELETE /part_issues/1.json
  def destroy
    @part_issue.destroy
    respond_to do |format|
      format.html { redirect_to part_issues_url, notice: 'Part issue was successfully destroyed.' }
      format.json { head :no_content }
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
