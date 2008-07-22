class DisUserWork < NonArItem
  # examples of links
  # http://udl.diy.concord.org/external_otrunk_activities/1/sail_jnlp/6/5/view?reporting=reporting
  
  # currently the user work config holds the 6/5 in the url above.  6 is the vendor id, 5 is the user id
  
  def actions(offering)
    actions = []
      
    dis = self.item_service
    activity = self.parent_offering.item
    actions << "'<a href=\"#{dis.config}/#{activity.config}/sail_jnlp/#{self.config}/view?reporting=reporting\">Single User Report</a>'"
  end

end
