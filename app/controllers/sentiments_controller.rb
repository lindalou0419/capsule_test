class SentimentsController < ApplicationController
  def index
    @texts = Sentiment.all.order(created_at: :desc)
    @text = Sentiment.new
  end

  def create
    @text = Sentiment.new
    @text.message = params[:sentiment][:message]

    if @text.save
      if request.xhr?
        respond_to do |format|
          format.html do
            render partial: "test", locals: {text: @text}
          end
          format.json do
            render json: @text
          end
        end
      end
    else
      render :index
    end
  end
end
