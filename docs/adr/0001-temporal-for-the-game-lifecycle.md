# Temporal runs the Game lifecycle, partly as a learning choice

Each Game is one long-lived Temporal workflow that owns its Phases and its durable timers: closing the poll at the start time, prompting for Attendance at the end time, and scheduled Reminders. We chose it because durable timers and crash-safe resumption fit this lifecycle well, and because the Host wants to learn it. At this scale (about 20 players, one Game a week) a Postgres job table and a scheduler would also work, so Temporal is a deliberate step up in complexity, not a requirement. The case gets stronger as timers and scheduled Reminders are used.

The workflow holds process state only (Phase, timers, message identifiers). Money and Statuses live in Postgres (see ADR-0004). Temporal runs as a shared self-hosted server with a namespace per project; this app reads the address and namespace from its environment.
