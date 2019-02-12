class Admin::BudgeRulesController < Admin::BaseController

  before_action :authenticate_user!
  before_action :set_budge_rule, only: %i[destroy show edit update]

  def show
  end

  def destroy
    @budge_rule.destroy
    redirect_to admin_budge_rules_path
  end

  def index
    @budge_rules = BudgeRule.all
  end

  def new
    @budge_rule = BudgeRule.new
  end

  def create
    @budge_rule = BudgeRule.new(budge_rule_params)
    if @budge_rule.save
      redirect_to admin_budge_rules_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_budge_rules_path
    else
      render :edit
    end
  end

  private

  def set_budge_rule
    @budge_rule = BudgeRule.find(params[:id])
  end

  def budge_rule_params
    params.require(:budge_rule).permit(:badge_id, :rule_id)
  end
end
