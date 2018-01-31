require_relative '../views/sessions_view.rb'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    username = @view.ask_for(:username)
    password = @view.ask_for(:password)

    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      @view.welcome(employee)
      return employee
    else
      @view.wrong_credentials
      sign_in
    end
  end
end
