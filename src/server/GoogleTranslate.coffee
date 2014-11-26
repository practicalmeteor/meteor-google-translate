@practical ?= {}

class practical.GoogleTranslate

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
    translate = Meteor.wrapAsync(@googleTranslate.translate, @googleTranslate)
    translate(text,lang)



@GoogleTranslate = practical.GoogleTranslate.get()