require('pg')
require_relative('../db/sql_runner')

class Tag

  attr_accessor :title, :budget
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @budget = options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO tags (
    title,
    budget
    ) VALUES ($1, $2) RETURNING id"
    values = [@title, @budget]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE tags SET (
    title,
    budget) =
    ( $1, $2 ) WHERE id = $3"
    values = [@title, @budget, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run(sql)
    return results.map {|result|Tag.new(result)}
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Tag.new(results[0])
  end

end
