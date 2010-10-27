class EmailParserController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :verify_signature

  SECRET = '58616b885556cc7d0b6e'
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

  protected

  def verify_signature
    provided = request.request_parameters.delete(:signature)
    signature = Digest::MD5.hexdigest(request.request_parameters.sort.map{|k,v| v}.join + SECRET)

    if provided != signature
      render :text => "Message signature fail #{provided} != #{signature}", :status => 403
      return false 
    end
  end
  
  private
  def clean_param(param)
    param.gsub(/\n/,'') if param
  end

end
