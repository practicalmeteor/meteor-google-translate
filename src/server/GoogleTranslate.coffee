@practical ?= {}

class practical.GoogleTranslate

#  _.str = Npm.require('underscore.string');
  _.mixin(_s.exports());
#  _.mixin(_.string.exports());
  instance = null

  @get: ->
    instance ?= new practical.GoogleTranslate()

  constructor: ->
    apiKey = Meteor.settings?.services?.google?.translate?.apiKey
    if not apiKey
      log.error('Missing Meteor.settings.services.google.translate.apiKey')
      throw new Error('practicalmeteor:google-translate: Missing Meteor.settings.services.google.translate.apiKey')
    @googleTranslate = Npm.require('google-translate')(apiKey)

  translate: (text,lang)->
    #TODO evaluate if text is capitalized, titleized, lowercase or uppercase to return it in the same way
    expect(text).to.be.a("string");
    text = text.toLowerCase();
    translate = Meteor.wrapAsync(@googleTranslate.translate, @googleTranslate)
    translation = translate(text,lang)
    console.log translation
    translation.translatedText = _.titleize(translation.translatedText)
    translation

@GoogleTranslate = practical.GoogleTranslate.get()