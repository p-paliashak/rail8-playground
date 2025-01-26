class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: %i[edit update destroy]

  def index
    @bank_accounts = Current.user.bank_accounts
  end

  def new
    @bank_account = Current.user.bank_accounts.new
  end

  def create
    @bank_account = Current.user.bank_accounts.new(bank_account_params)
    if @bank_account.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to bank_accounts_path, flash: { success: "Bank account created successfully." } }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @bank_account.update(bank_account_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to bank_accounts_path, notice: "Bank account updated successfully." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bank_account.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to bank_accounts_path, notice: "Bank account deleted successfully." }
    end
  end

  private

  def set_bank_account
    @bank_account = Current.user.bank_accounts.find(params[:id])
  end

  def bank_account_params
    params.require(:bank_account).permit(:name, :balance)
  end
end
