# ai-work-anki

Small Anki vocabulary workflow for generating French study cards and matching MP3 audio.

The repo includes a vocabulary knowledgebase, Anki import text files, and simple PowerShell scripts that call the Narakeet API (via the Narakeet CLI tool) to create pronunciation audio. Local secrets such as `narakeet.api` are ignored by git, so the public repo can contain the workflow without publishing API keys.

The Narakeet CLI tool:
https://www.narakeet.com/docs/automating/cli/