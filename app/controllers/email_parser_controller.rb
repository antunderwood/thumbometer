class EmailParserController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    @incoming_email = IncomingEmail.new(
      :text => params[:text],
      :html => params[:html],
      :to => clean_param(params[:to]),
      :from => clean_param(params[:from]),
      :subject => clean_param(params[:subject])
    )
    if request.post?
      @incoming_email.save
    end
  end
  
  private
  def clean_param(param)
    param.gsub(/\n/,'') if param
  end

end
