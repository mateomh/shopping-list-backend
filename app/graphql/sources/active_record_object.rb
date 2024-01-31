module Sources
  class ActiveRecordObject < GraphQL::Dataloader::Source
    def initialize(model_class, field =:id)
      @model_class = model_class
      @field = field
    end

    def fetch(ids)
      # records = @model_class.where(id: ids).index_by(&:id)
      # records.slice(*ids).values
      records = @model_class.where(@field => ids).to_a
      ids.map do |id|
        records.find{ |record| record.send(@field).to_s == id.to_s}
      end
    end
  end
end