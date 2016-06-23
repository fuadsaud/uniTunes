class CreateMedium
  def call(medium_params:)
    m = Medium.new(medium_params)

    content = self.class.const_get(medium_params[:media_content_type]).new(duration: 10)

    m.media_content = content

    m.save

    Response.new(medium: m)
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
