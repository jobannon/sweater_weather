class UserAccess 
  attr_reader :id, :token, :allow_access, :errors
  def initialize(token, allow_access, errors = nil)
    @id = nil
    @token = token
    @allow_access = allow_access
    @errors = errors
  end

  def return 
     if (@allow_access)
        {status: '201',
         body: {api_key: @token}}
     else
        {status: '401',
         body: {api_key: "UNAUTHORIZED - #{@errors}"}}
     end
  end
end
