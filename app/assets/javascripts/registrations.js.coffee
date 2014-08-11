# Stripe integration

$(".registrations").ready ->
  $.externalScript("https://js.stripe.com/v2/").done (script, textStatus) ->
    Stripe.setPublishableKey $("meta[name=\"stripe-key\"]").attr("content")
    subscription =
      setupForm: ->
        $(".card_form").submit ->
          $("input[type=submit]").prop "disabled", true
          if $("#card_number").length
            subscription.processCard()
            false
          else
            true


      processCard: ->
        card = undefined
        card =
          name: ($("#user_first_name").val() + ' ' + $("#user_last_name").val())
          number: $("#card_number").val()
          cvc: $("#card_code").val()
          expMonth: $("#card_month").val()
          expYear: $("#card_year").val()

        Stripe.createToken card, subscription.handleStripeResponse

      handleStripeResponse: (status, response) ->
        if status is 200
          $("#user_stripe_token").val response.id
          $(".card_form")[0].submit()
        else
          $("#stripe_error").text(response.error.message).show()
          $("input[type=submit]").prop "disabled", false
        return

    subscription.setupForm()

  return

