require_relative 'base_record'

class Employee < BaseRecord
  attr_reader :username, :password, :role

  def initialize(properties = {})
    super(properties)
    @username = properties[:username]
    @password = properties[:password]
    @role = properties[:role]
  end

  def manager?
    @role == 'manager'
  end

  def delivery_guy?
    @role == 'delivery_guy'
  end

  def to_csv_row
    [@id, @username, @password, @role]
  end

  def self.headers
    %w(id username password role)
  end
end
