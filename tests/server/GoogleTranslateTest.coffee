googleTranslate = new practical.GoogleTranslate()

Tinytest.add 'Google Translate - should translate text' , (test)->
  translation = googleTranslate.translate("my name is Brandon", "es")
  expect(translation).to.be.an("Object")
  expect(translation.translatedText).to.equal("mi nombre es Brandon")

Tinytest.add 'Google Translate - should translate text with multiple lines' , (test)->
  translation = googleTranslate.translate("my name is Brandon\ni like apples\n", "es")
  expect(translation).to.be.an("Object")
  expect(translation.translatedText).to.equal("mi nombre es Brandon me gusta manzanas")
