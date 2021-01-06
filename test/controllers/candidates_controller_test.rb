require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  def index
    @candidates = Candidate.all
  end

  def new 
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(params_candidate)
    if @candidate.save
      redirect_to candidates_path ,notice: "新增成功"
    else
      render :new
    end
  end

  def edit 
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])
    if @candidate.update(params_candidate)
      redirect_to candidates_path, notice: "修改成功"
    else
      render :edit
    end
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy if @candidate
    redirect_to candidates_path, notice: "刪除成功"
  end

  private
  def params_candidate
    params.require(:candidate).permit(:name, :age, :party, :politics, :votes)
  end
end
