class PartsController < ApplicationController

  def show
    @part = Part.find(params[:id])
    @invoice = @part.invoice
    session[:invoice_id] = @invoice.id
    session[:part_id] = @part.id
    session[:issue_id] = 0
    @issues = @part.issues.all
  end

  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @part = Part.find(params[:id])
    @part.destroy
    redirect_to @invoice
  end

end
