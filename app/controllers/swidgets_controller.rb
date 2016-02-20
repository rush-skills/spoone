class SwidgetsController < ApplicationController
  def big
    template = params[:sid].to_s
    template_name = template+"_big"
    render template_name, :layout => false
  end
  def small
    template = params[:sid].to_s
    template_name = template+"_small"
    render :layout => false

  end
end
