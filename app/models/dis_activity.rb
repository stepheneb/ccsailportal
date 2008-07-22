class DisActivity < NonArItem
  def actions(offering)
    actions = []
      
    dis = self.item_service
    actions << "'<a href=\"#{dis.config}/#{self.config}\">Show</a>'"
  end

end