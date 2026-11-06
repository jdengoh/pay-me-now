# pay-me-now

A private Telegram bot that helps one Host run a weekly floorball game: it tracks who is coming and who played, splits the court cost, and shows the group who has paid.

## Language

### People

**Host**:
The one person who runs the game and is the only one who controls the bot. Also a Player.
_Avoid_: Admin, organiser, owner

**Player**:
A person who may play. Identified by Telegram identity where known, so two people with the same name stay separate. The Host is a Player and is counted in the headcount and the split.
_Avoid_: Member, user, participant

**Guest**:
A one-off attendee linked to the Player who brought them.
_Avoid_: Plus-one, visitor

**Walk-in**:
A Player who played without having voted Yes.
_Avoid_: Drop-in

**Registry**:
The set of known Players with their names, handles and Aliases.
_Avoid_: Roster (a Roster is per Game), contacts

**Alias**:
A name or handle a Player has appeared under in a pasted poll, linked to exactly one Player.
_Avoid_: Nickname, alt name

### Games

**Game**:
One session with a date, start time, optional end time, label, Court Cost and a lifecycle. Players come and go freely from week to week.
_Avoid_: Match, session, event

**Phase**:
Where a Game is in its lifecycle: Roster, Attendance, Settlement, Collecting, Closed or Cancelled.
_Avoid_: Stage, state

**Roster Entry**:
One Player's stated intent for a Game: Yes or No. Not voting means no Roster Entry. There is no Maybe.
_Avoid_: Vote (a vote is the act; the Roster Entry is its result), RSVP

**Roster Source**:
Where a Game's Roster Entries come from: a poll posted by the bot, or a pasted old poll. Game logic never depends on which one was used.
_Avoid_: Import, feed

**Option Mapping**:
The Host's mapping of a pasted poll's free-text options (for example "yay", "👍", "nay") to Yes or No. Not needed for polls the bot posts.
_Avoid_: Vote translation

**Attendance**:
The Host-confirmed list of who actually played. Billing is driven by Attendance, never by Roster Entries.
_Avoid_: Check-in, turnout list

**Turnout**:
The number of people who physically played, Guests and Walk-ins included and Late Cancellers excluded. Compared with the Game's optional minimum to suggest how to treat Late Cancellers.
_Avoid_: Headcount (headcount includes charged Late Cancellers)

**Late Canceller**:
A per-Game flag on a Player who said Yes but did not play, carrying a decision to charge or waive them. It is not a Player attribute and has no history across Games.
_Avoid_: No-show, dropout

**Game Message**:
The single group message for a Game. It lists the Yes-voters before approval and the payment list after it. The group can only read it.
_Avoid_: Board, post, poll message

### Money

**Court Cost**:
The total cost of the court for a Game.
_Avoid_: Booking fee, price

**Share**:
What each chargeable person owes: the Court Cost divided by the chargeable count, rounded up to the next 10 cents. Fixed once the Billing Preview is approved.
_Avoid_: Split, fee, per-head amount

**Surplus**:
The total of all Charges minus the Court Cost, caused by rounding. It belongs to the Host and is shown in the Billing Preview only.
_Avoid_: Profit, change

**Billing Preview**:
The Host-only summary before approval: headcount, Share, total, Surplus and payee. All waiving happens here.
_Avoid_: Draft bill, summary

**Approval**:
The single step that locks Attendance, creates every Charge and posts the payment list. After it, Shares never change.
_Avoid_: Finalise, publish, confirm

**Charge**:
One person's obligation for one Game, with an amount and a Status.
_Avoid_: Invoice, debt, bill

**Status**:
Unpaid, Paid (✅) or Waived (❌). Paid also covers a Share the Host pays personally; there is no separate "absorbed" state and no record of payment method. Waived means the person is out of the cost altogether and is only possible before Approval.
_Avoid_: State, payment state

**Outstanding**:
Unpaid Charges across all Games, closed ones included.
_Avoid_: Arrears, balance

**Reminder**:
A fresh copy of the payment list posted to the group, replacing the previous one, sent on request or on a schedule while anyone is Unpaid.
_Avoid_: Nudge, ping (a ping notifies a person; a Reminder is a message)
