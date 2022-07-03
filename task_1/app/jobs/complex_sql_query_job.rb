require_relative '../../lib/external_call'

class ComplexSqlQueryJob < ApplicationJob
  queue_as :complex_sql_query

  def perform(article_params)
    ExternalCall.run_complex_sql_query(article_params)
  end
end
