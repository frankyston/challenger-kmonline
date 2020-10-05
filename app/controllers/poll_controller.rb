class PollController < ApplicationController
  before_action :authenticate_user!, :only =>[:show]
  
  def index
    @polls = Survey.all.order("id desc")
    #@poll_answer = PollAnswer.new
  end

  def show
    @survey = Survey.find(params[:id])
    @poll_answer = PollAnswer.new
  end

  def create
      @poll_answer = PollAnswer.new(poll_answer_params)
      @poll_answer.ip = request.remote_ip
      @poll_answer.survey_id = params[:id]
      @poll_answer.user_id = current_user.id
      if @poll_answer.save
        flash[:success] = "Pesquisa realizada com sucesso. Em breve divulgaremos o resultado."
      else
        flash[:error] = "Erro ao realizar a pesquisa ou você já realizou sua pesquisa."
      end
      redirect_to request.referrer
  end

  private
    def poll_answer_params
      params.require(:poll_answer).permit(:answer_id)
    end
end
