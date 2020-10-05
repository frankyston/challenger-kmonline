class PollController < ApplicationController
  before_action :set_survey
  
  def index
    @polls = Survey.all.order("id desc")
    #@poll_answer = PollAnswer.new
  end

  def show
    @voted = PollAnswer.where(survey_id: @survey.id).where(user_ip: request.remote_ip).size > 0
    @poll_answer = PollAnswer.new
  end

  def create
    @poll_answer = PollAnswer.new(poll_answer_params)
    @poll_answer.user_ip = request.remote_ip
    @poll_answer.survey_id = @survey.id
    #@poll_answer.user_id = current_user.id
    if @poll_answer.save
      flash[:success] = "Pesquisa realizada com sucesso. Em breve divulgaremos o resultado."
      redirect_to action: :index
    else
      flash[:error] = "Erro ao realizar a pesquisa ou você já realizou sua pesquisa."
      render :show
    end
  end

  private
    def set_survey
      @survey = Survey.find_by_permalink(params[:permalink])
    end

    def poll_answer_params
      params.require(:poll_answer).permit(:answer_id)
    end
end
