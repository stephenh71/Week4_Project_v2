require('pg')
require_relative('../db/sql_runner')

class Merchant

  attr_accessor :name
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE merchants SET (name) = ROW($1) WHERE id = $2"
    values = [@name, @id]
    results = SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run(sql)
    return results.map {|result|Merchant.new(result)}
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Merchant.new(results[0])
  end

end
