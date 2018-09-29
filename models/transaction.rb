require('pg')
require_relative('../db/sql_runner')

class Transaction

  attr_accessor :trans_date, :amount
  attr_reader :id, :merchant_id, :tag_id

  def initialize( options )
    @id = options['id'].to_i
    @trans_date = options['trans_date']
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount = options['amount'].to_i
  end

  def save()
    sql = "INSERT INTO transactions (
    trans_date,
    merchant_id,
    tag_id,
    amount
    )
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@trans_date, @merchant_id, @tag_id, @amount]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def merchant()
    merchant = Merchant.find(@merchant_id)
    return merchant
  end

  def tag()
    tag = Tag.find(@tag_id)
    return tag
  end

  def update()
    sql = "UPDATE transactions SET (
    trans_date,
    merchant_id,
    tag_id,
    amount) =
    ( $1, $2, $3, $4 ) WHERE id = $5"
    values = [@trans_date, @merchant_id, @tag_id, @amount, @id]
    results = SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    return results.map {|result|Transaction.new(result)}
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Transaction.new(results[0])
  end

end
