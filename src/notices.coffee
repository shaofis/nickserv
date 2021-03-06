# NickServ notices
# Notices can be different based on server.
# Debug mode can be turned on to observe nickserv notices
# and find out exactly what message they send after each command.
# Then it's just a matter of adding it to the list of matches.

module.exports =
  identify:
    error:
      invalidPassword: invalidPassword =
        msg: '%s is not a valid password.'
      notRegistered: notRegistered =
        msg: '%s is not a registered nickname.'
        match: [
          /^(.+) is not a registered nickname\.$/m
          /^Your nick isn't registered\.$/m
        ]
      unknownCommand: unknownCommand =
        msg: 'Unknown Command'
        match: [
          /^Unknown command verify\.  "\/msg NickServ HELP" for help\./m
        ]
      wrongPassword:
        msg: 'Wrong password.'
        match: [
          /^Invalid password for .+\.$/m
        ]
      alreadyIdentified: alreadyIdentified =
        msg: 'You are already identified.'
      awaitingVerification: awaitingVerification =
        msg: 'This nick is awaiting email verification.'
        match: [
          /^This nick is awaiting an e-mail verification code before completing registration\.$/m
        ]
    success: [
      /^Password accepted - you are now recognized\.$/m
      /^You are now identified for (.+)\.$/m
    ]

  logout:
    error:
      notIdentified: notIdentified =
        msg: 'You must first be identified.'
        match: [
          /^You must first be identified./m
        ]
      unknownCommand: unknownCommand
    success: [
      /^Your nick has been logged out\.$/m
    ]

  register:
    error:
      invalidPassword: invalidPassword
      unknownCommand: unknownCommand
      invalidEmail:
        msg: '%s is not a valid email address.'
        match: [
          /^(.+) is not a valid email address\.$/m
        ]
      invalidParameters:
        msg: 'Invalid parameters for register'
        match: [
          /^Your password is too long\. Please try again with a shorter password\.$/m
          /^Invalid parameters for REGISTER\.$/m
        ]
      tooManyAccounts:
        msg: '%s has too many accounts registered.'
        match: [
          /^(.+) has too many accounts registered\.$/m
        ]
      notEnoughParameters:
        msg: 'Insufficient parameters for register.'
        match: [
          /^Insufficient parameters for REGISTER\.$/m
        ]
      alreadyRegistered:
        msg: 'You are already registered.'
        match: [
          /^(.+) is already registered\.$/m
          /^This nickname is registered and protected\.  If it is your/m
          /^This nick is awaiting an e-mail verification code before completing registration\.$/m
          /^This nick has already been requested, please check your e-mail address for the pass code$/m
        ]
      alreadyIdentified: alreadyIdentified
      tooSoon:
        msg: 'You must be using this nick for a bit before registering.'
        match: [
          /^You must have been using this nick for at least (\d+) (\w+) to register\.$/m
        ]
    success: [
      /^Nickname (.+) registered under your account/m
      /^(.+) is now registered to .+, with the password (.+)\.$/m
      /^A passcode has been sent to (.+), please type \/msg NickServ confirm <passcode> to complete registration$/m
    ]

  drop:
    error:
      invalidNick: invalidNick =
        msg: 'Nickname is invalid.'
      notIdentified: notIdentified
      notRegistered: notRegistered
      unknownCommand: unknownCommand
      accessDenied:
        msg: 'Access denied.'
        match: [
          /^Access denied\.$/m
        ]
    success: [
      /^Nickname (.+) has been dropped\.$/m
    ]

  setPassword:
    error:
      invalidPassword: invalidPassword
      unknownCommand: unknownCommand
      invalidParameters:
        msg: 'Invalid parameters for password.'
        match: [
          /^Invalid parameters for PASSWORD\.$/m
        ]
      notIdentified: notIdentified
    success: [
      /^The password for (.+) has been changed to (.+)\.$/m
    ]

  verify:
    error:
      invalidNick: invalidNick
      invalidKey:
        msg: 'Key is invalid.'
      invalidParameters:
        msg: 'Insufficient parameters for verify.'
        match: [
          /^Insufficient parameters for VERIFY\.$/m
        ]
      notAwaiting:
        msg: '%s is not awaiting authorization.'
        match: [
          /^(.+) is not awaiting authorization\.$/m
        ]
      wrongKey:
        msg: 'Wrong key.'
        match: [
          /^Verification failed\. Invalid key for (.+)\.$/m
        ]
      notRegistered: notRegistered
      notIdentified: notIdentified
      unknownCommand: unknownCommand
    success: [
      /^(.+) has now been verified\.$/m
    ]

  info:
    error:
      invalidNick: invalidNick
      notIdentified: notIdentified
      notRegistered: notRegistered
      unknownCommand: unknownCommand
      networkServices:
        msg: '%s is part of network services.'
        match: [
          /^Nick (.+) is part of this Network's Services\.$/m
        ]
      awaitingVerification: awaitingVerification
    success: [
      /^([\w\d]+) is ([\w\d\s]+)$(\n^[\w\d]+ is currently (online|offline)\.)?(\n^   Is online from: (.+)$)?\n^  Time registered: (.+)$(\n^   Last seen time: (.+)$)?(\n^Last quit message: (.+)$)?(\n^   E-mail address: (.+)$\n^          Options: (.+)$)?/m
    ]

  isRegistered:
    error:
      invalidNick: invalidNick
      notRegistered: notRegistered
