module Puppet::Parser::Functions
  
  newfunction(:get_tags, :type => :rvalue) do |args|
    
    #
    # Returns all tags required for dataloop
    #
    # args:
    #   array of tags
    #   array of facter fact names to turn into tags
    # returns:
    #   comma separated string of tags
    #

    $tags = args[0]
    $facter_tag_names = args[1]

    for tag_name in $facter_tag_names
      $tags.push(lookupvar(tag_name))
    end

    $tags.join(',')

  end
end
