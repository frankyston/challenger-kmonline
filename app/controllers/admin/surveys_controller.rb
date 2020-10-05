class Admin::SurveysController < Admin::BaseController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  def index
    @surveys = Survey.all
  end

  def show
  end

  def new
    @survey = Survey.new
    question = @survey.questions.build
    4.times { question.answers.build }
  end

  def edit
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      flash[:notice] = "Pesquisa Criada com sucesso."
      redirect_to admin_survey_path(@survey)
    else
      render :new
    end
  end

  def update
    if @survey.update(survey_params)
      flash[:notice] = "Pesquisa atualizada com sucesso."
      redirect_to admin_survey_path(@survey)
    else
      render :edit
    end
  end

  def destroy
    @survey.destroy
    flash[:notice] = "Pesquisa excluída com sucesso."
    redirect_to admin_surveys_url
  end

  private
    def set_survey
      @survey = Survey.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit(:name, :date_init, :date_end,
      questions_attributes: [
        :content, :id, :survey_id, :_destroy,
        answers_attributes: [:content, :id, :questions_id, :_destroy]
      ])
    end
end
