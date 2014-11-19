googleTranslate = new practical.GoogleTranslate()

Tinytest.add 'Google Translate - should translate text' , (test)->
  translation = googleTranslate.translate("My name is Brandon", "es")
  expect(translation).to.be.an("Object")
  expect(translation.translatedText).to.equal("Mi nombre es Brandon")