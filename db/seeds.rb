tags = ['Bez PRIV', 'Tylko odbiór osobisty', 'Bez gwarancji', 'Bez zwrotu', 'Bez negocjacji']
tags.each do |tag|
  Tag.create(name: tag)
end
