# Bot-only: no user-account session, so human-posted polls need paste

A Telegram bot receives votes only for polls it posted itself. Reading voters on polls posted by humans would need a logged-in user-account session (MTProto) acting as the Host, which would hold a powerful secret and risk the Host's account. We decided against it. New Games start from a Yes/No poll the Host asks the bot to post; old or human-posted polls are tracked by pasting names and handles.

Consequence: a pasted Player has a handle but no Telegram ID until they vote in a bot-posted poll, at which point they are linked by matching username. A user-account reader may be revisited later as an optional adapter behind the Roster Source shape.
