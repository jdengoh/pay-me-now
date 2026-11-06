# Postgres is the source of truth for money; the workflow owns process only

Charges, Statuses, the Registry and the append-only record of every Charge change live in Postgres. The Temporal workflow holds only process state: Phase, timers and group message identifiers, and touches money solely through activities. The group message is always rendered from database state, never patched incrementally.

We chose this over keeping balances in workflow state because workflow history is awkward to query across Games (the Outstanding view), hard to correct, and tied to Temporal's retention. Corrections are new ledger entries; nothing is edited or deleted.
