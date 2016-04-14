class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :can_access, only: [:destroy]
  def expired
    @licenses = License.expired
  end

  def date
    @start = ""
    @end = ""
    if params[:start].present? && params[:end].present?
      @licenses = License.where(creation_date: params[:start].to_date..params[:end].to_date)
      @start = params[:start]
      @end = params[:end]
    end
  end

end

