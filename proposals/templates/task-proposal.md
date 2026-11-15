# Task Track proposal

**PR title format:** `[Task Proposal] [<Domain>] <Short task title>`

Example: `[Task Proposal] [Travel & commuting] Adapt an airport pickup after a flight change`

Copy this template to `proposals/task/<slug>.md`. Keep the persona, story and personalization insight concise. Sections 5–10 record the design decisions that implementation depends on; short bullet answers are enough at proposal stage. The construction plan defines the scope, deliverables, quality checks and effort that reviewers will follow through implementation and merge in this same PR.

✍️ Replace each `[Fill in: …]` with your answer. Optional fields can be `None`. For unresolved details, use `TBD` and explain how they will be resolved.

## 1. Task and domains

- **Authors / GitHub handles (required):** `[Fill in: names and @handles]`
- **Short task title (required):** `[Fill in: a concise task title]`
- **Primary domain (required):** `[Fill in: one domain from the table below]`
- **Secondary domains (optional):** `[Fill in: other relevant domains, or None]`
- **Related proposals (optional):** `[Fill in: Environment or Task PRs this task depends on or overlaps with, or None]`

### Domain names

Use the exact names from the [homepage](../../README.md#environment-domains). Choose one primary domain and optional secondary domains; list the primary first in the PR title and join others with ` + `.

<table>
<tr><td>💳 <strong>Money &amp; insurance</strong></td><td>🛍️ <strong>Shopping &amp; groceries</strong></td><td>✈️ <strong>Travel &amp; commuting</strong></td></tr>
<tr><td>🩺 <strong>Health &amp; care</strong></td><td>🍽️ <strong>Food &amp; dining</strong></td><td>💬 <strong>Social &amp; communities</strong></td></tr>
<tr><td>🏠 <strong>Home &amp; utilities</strong></td><td>🏛️ <strong>Public service &amp; law</strong></td><td>🎬 <strong>Media &amp; entertainment</strong></td></tr>
<tr><td>📚 <strong>Learning &amp; research</strong></td><td>💼 <strong>Work &amp; business</strong></td><td>📰 <strong>News &amp; information</strong></td></tr>
<tr><td>🌤️ <strong>Weather &amp; outdoors</strong></td><td>🎮 <strong>Games &amp; play</strong></td><td>🏃 <strong>Fitness &amp; wellbeing</strong></td></tr>
</table>

## 2. User persona and prior history

Who is the user? Briefly describe the background, preferences and prior experiences that matter to this task.

**✍️ Your answer (required):** `[Fill in: user persona and relevant history]`

- **Shared persona or world (optional):** `[Fill in: an existing persona and history this task reuses or extends, or New]`

## 3. Story outline

What does the user want, what changes, and what would a good outcome look like? Mention the approximate time span if relevant.

**✍️ Your answer (required):** `[Fill in: the story outline]`

## 4. What makes this distinct and personal

How does this person's context change the right action, and what might a generic assistant miss?

**✍️ Your answer (required):** `[Fill in: the central personalization challenge or insight]`

## 5. Decisive context and discoverability

Which facts decide the right action, where do they live, and how can an agent find them before the user mentions them? Each decisive fact must be discoverable through the task's tools or a natural, targeted question to the user; undiscoverable requirements do not count as difficulty.

**✍️ Decisive facts (required):**

| Decisive fact | Where it lives (app / record) | How an agent can discover it | Misleading surface |
| :--- | :--- | :--- | :--- |
| `[Fill in: fact that changes the right action]` | `[Fill in: e.g. Mail thread, Calendar event, earlier session]` | `[Fill in: direct lookup, cross-app check, inference from several records, or targeted question]` | `[Fill in: the stale or plausible-but-wrong signal a generic agent would follow, or None]` |

- **Challenge categories (required):** `[Fill in: one or more categories from the README personalization challenges, e.g. Memory Conflicts and Updates; Safety and Boundaries]`
- **Planned hint (required):** `[Fill in: the fixed hint for the hint-assisted run; it points to the decisive context without revealing the answer or grader details]`

## 6. Simulated user and other people

How do the user and anyone else in the story behave? The simulated user answers truthfully when asked but does not volunteer information the records already contain.

- **What the user knows and answers when asked (required):** `[Fill in: facts the user can confirm, and the questions that would surface them]`
- **What the user does not volunteer (required):** `[Fill in: context the agent must find or ask about]`
- **Response to agent proposals (required):** `[Fill in: e.g. approves without checking details, questions amounts, refuses certain actions]`
- **Permissions and boundaries (required):** `[Fill in: spending limits, actions that need confirmation, information that must not be shared, and how consent changes over time]`
- **Other people or agents (optional):** `[Fill in: other simulated people or their agents, what they know and when they respond, or None]`
- **Simulation mode (optional):** `[Fill in: scripted replies, LLM intent classification with scripted replies, or free LLM replies; fallback reply for off-script questions; how answers stay consistent across rollouts]`

## 7. Timeline, sessions and memory

How does the world change while the task is underway, and what carries over between sessions?

**✍️ Timeline (required):**

| Session / simulated time | User request or world event | What it changes or invalidates | What the agent should notice |
| :--- | :--- | :--- | :--- |
| `[Fill in: e.g. Session 1, Day 1 09:00]` | `[Fill in: request, message, price change, deadline, withdrawn consent]` | `[Fill in: earlier fact or plan that no longer holds, or None]` | `[Fill in: expected awareness or action]` |

- **Memory across sessions (required):** `[Fill in: environment-provided history, agent-written memory stored in the environment, or agent-native memory; which state carries over]`
- **No-reply and branch paths (optional):** `[Fill in: what happens if someone does not answer or the agent takes a different route, or None]`

## 8. Outcomes and grading intent

What must be true at the end, and how are partial or wrong outcomes treated? Grading checks end state and recorded actions; multiple valid strategies must be accepted.

- **Success gates (required):** `[Fill in: end-state conditions required for full-task success]`
- **Partial credit and representative wrong outcomes (required):** `[Fill in: rubric items worth partial points; typical incorrect or incomplete outcomes and how they score]`
- **Acceptable alternative strategies (required):** `[Fill in: other valid orders or approaches that must not be penalized]`
- **Prohibited actions and side effects (required):** `[Fill in: irreversible, unauthorized or privacy-violating actions that fail the task]`
- **Expected failure modes and target tier (required):** `[Fill in: why current agents are likely to fail; Accepted or Flagship]`
- **Counterfactual variants (optional):** `[Fill in: a test matrix with one row per variant: which decisive fact it changes, the condition and the expected action; the task counts as resolved only if the original and every variant are, or None]`
- **Efficiency expectations (optional):** `[Fill in: turn, tool-call, time or cost budget, and whether efficiency is scored, or None]`

## 9. Environments, modalities and external dependencies

- **Required environments and actions (required):** `[Fill in: apps/websites and the reads/writes this task needs; link Environment proposal PRs and mark anything missing]`
- **Modalities and devices (optional):** `[Fill in: text only, or voice, images, wearable/sensor signals and the devices involved]`
- **Live or external dependencies (optional):** `[Fill in: live websites or services and the replay or mocking strategy, or None]`

## 10. Provenance and privacy

- **Source of the story (required):** `[Fill in: invented, transformed from a real experience, or adapted from public material]`
- **Personal data check (required):** `[Fill in: confirm no private messages, account details or third-party personal information; describe transformations for a real experience]`
- **Collected media and licenses (optional):** `[Fill in: sources and licenses for images, audio or documents, or None]`
- **Credits by role (optional):** `[Fill in: story source (opt-in, may be anonymous), task design, implementation and review contributors]`
- **Release visibility (optional):** `[Fill in: public, or suitable for a held-out evaluation set; any parts that must stay private, such as grader details]`

## 11. Construction plan and effort

Specify the work needed to turn the story into an executable, scoreable task, building on the decisions in sections 5–10. Include expected coverage and effort in person-days; estimates may be ranges. The user rollout is the planned sequence of user interactions and responses, including branches. Agent rollouts are actual model executions against that scenario.

**✍️ Work breakdown (required):**

| Workstream | Planned work and scale | Deliverable / quality check | Effort (person-days) |
| :--- | :--- | :--- | :--- |
| Persona, history and workspace | `[Fill in: context, records/media to create or reuse, quantities and sources]` | `[Fill in: coherent user context and discoverable evidence for the personalization insight]` | `[Fill in: estimate]` |
| User rollout and scenario script | **Sessions:** `[Fill in: number of sessions]`<br>**Simulated world time span:** `[Fill in: hours, days, months or years covered]`<br>**Estimated total tokens:** `[Fill in: range or order of magnitude across all sessions]` | `[Fill in: executable user script, response/no-reply paths, changes over simulated time and state carried across sessions]` | `[Fill in: estimate]` |
| Environment integration | `[Fill in: apps/environments to reuse or build, fixtures, actions and missing dependencies]` | `[Fill in: runnable task package and initial-state/reset checks]` | `[Fill in: estimate]` |
| Rubrics, reference and hints | `[Fill in: intended success criteria, key constraints, reference approach and hint design]` | `[Fill in: grading checks for success, partial/incorrect actions and reference feasibility]` | `[Fill in: estimate]` |
| Agent rollouts and analysis | `[Fill in: planned runs per designated GPT, Claude and Gemini model, hinted runs and analysis work]` | `[Fill in: traces, scores and failure analysis meeting the linked validation protocol]` | `[Fill in: estimate]` |

Estimate token volume for **one complete scenario across all sessions** and state what is included, such as dialogue, prior context and tool outputs. The simulated time span is the time elapsed in the user's world; development duration is recorded below.

- **Milestones, owners and dependencies (required):** `[Fill in: work order, responsible contributors, expected calendar duration and environment/infra dependencies; link related PRs]`
- **Resources and total effort (required):** `[Fill in: total person-days, estimated model/API and generation costs, and compute needs; estimates or explained TBDs]`
- **Scope boundary and open questions (required):** `[Fill in: what is excluded or deferred, and how unresolved decisions will be settled]`

After approval, add the script, grader and author-run evidence against these deliverables in the same PR. Reviewers use the approved plan as the acceptance baseline; substantial scope changes require another design review. Follow the [implementation and validation guide](../../CONTRIBUTING.md#task-difficulty-and-validation).
