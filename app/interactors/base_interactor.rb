class BaseInteractor
  include Interactor

  def transaction
    ActiveRecord::Base.transaction { yield }
  end
end