gapi = Npm.require("googleapis")

@practical ?= {}

class practical.GoogleTranslate

  instance = null
  serverApiKey: null
  @get: ->
    instance ?= new practical.GoogleTranslate()

  constructor: ->
    @serverApiKey = Meteor.settings?.services?.google?.translate?.serverApiKey
    if not @serverApiKey
      log.error('Missing Meteor.settings.services.google.translate.serverApiKey')
      throw new Error('practicalmeteor:google-translate: Missing Meteor.settings.services.google.translate.serverApiKey')
    @googleTranslate = gapi.translate({version:'v2', auth: @serverApiKey})


  ###
    Translate any text to a target language also you can specify the source language
    @param {string} text the text that will be translated
    @param {string} target language to translate text
    @param {string} source the original languaje
    @param {string} format indicate that the text to be translated is either plain-text or HTML.
                    Available params: (text, html)
    @see https://cloud.google.com/translate/v2/using_rest#language-params for full reference
  ###
  translate: (text, target, source = 'en', format = "text")->
    translate = Meteor.wrapAsync(@googleTranslate.translations.list , @googleTranslate)
    data = translate({q: text, target: target, source: source, format: format}).data
    # TODO support multiple translations
    translation = data.translations[0].translatedText
    return translation

GoogleTranslate = practical.GoogleTranslate.get()