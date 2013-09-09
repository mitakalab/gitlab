class Gitlab::Client
  # Defines methods related to deploy_keys.
  module DeployKeys
    # Gets a list of project's deploy keys.
    #
    # @example
    #   Gitlab.keys(3)
    #
    # @param  Integer id The ID of a project.
    # @return [Array<Gitlab::ObjectifiedHash>]
    def keys(id)
      get("/projects/#{id}/keys")
    end

    # Gets a single key.
    #
    # @example
    #   Gitlab.key(3, 10)
    #
    # @param  Integer id The ID of a project.
    # @param  Integer key_id The ID of a deploy key.
    # @return [Gitlab::ObjectifiedHash]
    def key(id, key_id)
      get("/projects/#{id}/keys/#{key_id}")
    end

    # Adds a new deploy key to the project.
    #
    # @example
    #   Gitlab.add_key(42, 'gitlab', 'ssh-rsa ...')
    #
    # @param  Integer id The ID of a project.
    # @param  String title The title of a new deploy key..
    # @param  String key The SSH public key.
    # @return [Gitlab::ObjectifiedHash] Information about added key.
    def add_key(id, title, key)
      post("/projects/#{id}/keys", :body => {:title => title, :key => key}) 
    end

    # Delete a deploy key from the project.
    #
    # @example
    #   Gitlab.dlete_key(3, 10)
    #
    # @param  Integer id The ID of a project.
    # @param  Integer key_id The ID of a deploy key.
    # @return [Gitlab::ObjectifiedHash] Information about added key.
    def delete_key(id, key_id)
      delete("/projects/#{id}/keys/#{key_id}")
    end

end
