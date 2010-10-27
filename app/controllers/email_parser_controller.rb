class EmailParserController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    if params[:to] =~ /cloudmail/
      @incoming_email = IncomingEmail.new(
        :body_text => params[:plain],
        :body_html => params[:html],
        :to => clean_param(params[:to]),
        :from => clean_param(params[:from]),
        :subject => clean_param(params[:subject])
      )
    else
      @incoming_email = IncomingEmail.new(
        :body_text => params[:text],
        :body_html => params[:html],
        :to => clean_param(params[:to]),
        :from => clean_param(params[:from]),
        :subject => clean_param(params[:subject])
      )
    end
    if request.post?
      @incoming_email.save
    end
  end
  
  private
  def clean_param(param)
    param.gsub(/\n/,'') if param
  end

end
