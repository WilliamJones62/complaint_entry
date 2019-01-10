class IssuesController < ApplicationController

  def show
    @issue = Issue.find(params[:id])
    @invoice = @issue.invoice
    session[:invoice_id] = @invoice.id
    session[:issue_id] = @issue.id
    session[:part_id] = 0
    @parts = @issue.parts.all
  end

  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @issue = Issue.find(params[:id])
    @issue.destroy
    redirect_to @invoice
  end

end
