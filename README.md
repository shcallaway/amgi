# Amgi

Amgi is a flashcard app - similar to [Anki](https://apps.ankiweb.net/) - that uses [spaced repitition](https://en.wikipedia.org/wiki/Spaced_repetition) for efficient memorization.

I set out to build Amgi because I was unsatisfied with other flashcard apps (e.g. Quizlet, Anki). In these other apps, the user interface was unappealing, and it very difficult to create new cards and "decks" (called "collections" in Amgi). I wanted a fast, super-clean user interface that would allow me to focus on completing my daily review, as a well as a way to bulk-upload and builk-modify cards.

At the time of writing, Amgi is built entirely with [Retool](https://retool.com/) and Postgres. It has no API-layer whatsoever. This is for two reasons: first, I wanted an extremely simple architecture, and second, I wanted to improve my Postgres skills. :)
