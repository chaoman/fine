# Controller concern providing pagination functionality
module Paginatable
  def paginate(entities, options = { order: 'created_at DESC', limit: 10, offset: 0 })
    entities.order(options[:order])
            .limit(options[:limit])
            .offset(options[:offset])
  end

  def paginate_array(entities, limit = 20, page = 0)
    entities.drop(page * limit).first(limit)
  end
end
