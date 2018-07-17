# Controller concern providing pagination functionality
module Paginatable
  def paginate(entity, options = { order: 'created_at DESC', limit: 10, offset: 0 })
    entity.order(options[:order])
          .limit(options[:limit])
          .offset(options[:offset])
  end
end
