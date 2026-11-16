# Task author checklist (draft)

Fill this in before requesting design review, and keep it in your proposal PR description or proposal file. The reasoning behind each item is in [design.md](design.md).

## Deciding facts

- [ ] Each deciding fact has at least one documented discovery path through tools the agent can use, and a discoverability level (A direct, B cross-app, C inferred, D ask only)
- [ ] Level D facts can be found with a question an ordinary assistant would naturally ask
- [ ] There is a plausible but wrong surface (an outdated reminder, an old calendar entry) that a list-executing agent would follow
- [ ] At most three deciding facts, one of them primary
- [ ] Each deciding fact changes a checkable action (who is paid, what is booked, who is told), not only the wording of a reply

## Simulated user

- [ ] The script covers a targeted question, a vague question ("Nothing comes to mind") and an agent proposal (trusting user by default)
- [ ] The user only knows what this person would plausibly know
- [ ] Off-script questions get the fallback reply; small talk never mentions a deciding fact
- [ ] The task ships test questions for the intent classifier

## Outcomes and variants

- [ ] Success criteria describe the end state, not the steps, and list at least one other valid strategy
- [ ] Prohibited actions and side effects are listed
- [ ] The test matrix has at least one variant row with its changed fact, condition and expected action
- [ ] The fixed hint points to the decisive context without giving the answer or grader details
- [ ] The memory approach is labeled (environment history, agent writes and environment stores, or agent-native)

## Realism and privacy

- [ ] A real person could plausibly have these records; the timeline is coherent; the trap is something that happens in ordinary life
- [ ] Background records include unrelated noise, not only task-relevant items
- [ ] Everything is invented or transformed beyond recognition; no private messages, account details or third-party personal information
- [ ] The task context does not contradict the base profile or accepted tasks (fact registry check)
- [ ] Story credit, if any, is opt-in and may be anonymous

## Automated checks (run before review)

- [ ] The reference solution scores 100% and passes every success gate
- [ ] An agent that does nothing scores 0
- [ ] A probe agent that only asks vague questions scores 0
- [ ] Every deciding fact has evidence in the task data
