tags = ['Bez PRIV', 'Tylko odbiór osobisty']
tags.each do |tag|
  Tag.create(name: tag)
end
