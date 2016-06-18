class CreateMedium
  def call(medium_params:)
    Response.new(medium: Medium.create(medium_params))
  end

  Response = ImmutableStruct.new(:medium) do
    def success?
      medium.persisted?
    end

    def failed?
      !success
    end
  end
end
