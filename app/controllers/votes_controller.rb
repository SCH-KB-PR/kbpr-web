class VotesController < ApplicationController
  before_action :set_vote, only: %i[ show edit update destroy ]
  # GET /votes or /votes.json
  def index
    @votes = Vote.all.order(created_at: :desc)
  end

  # GET /votes/1 or /votes/1.json
  def show

  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes or /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to vote_question_url(@vote.vote_question_id), notice: "Sikeresen szavaztál!" }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1 or /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to vote_url(@vote), notice: "A szavazást sikeresen frissítettük!" }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1 or /votes/1.json
  def destroy
    @vote.destroy

    respond_to do |format|
      format.html { redirect_to votes_url, notice: "A szavazást sikeresen töröltük" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
      authorize @vote
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:user_id, :vote_question_id, :vote_type)
    end
end