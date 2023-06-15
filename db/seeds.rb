tags = ['Bez PRIV', 'Tylko odbiór osobisty', 'Dziś oddam', 'Tylko zdecydowane', 'Tylko dzisiaj']
tags.each do |tag|
  Tag.create(name: tag)
end
