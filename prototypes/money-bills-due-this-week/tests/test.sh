#!/bin/bash
# Runs in the agent sandbox after the agent finishes (shared verifier mode).
# Pulls the final world state from the sidecar and writes /logs/verifier/reward.json.
set -u
mkdir -p /logs/verifier
python3 /tests/check_state.py || echo '{"reward": 0.0}' > /logs/verifier/reward.json
