# Track ③ open questions for the original team and maintainers

Status: open, November 2026

Track ③ is defining the content specification for PALE tasks: how people and their history are written, how the simulated user responds, and what community contributors submit. Much of this was already done for the closed PersonalAgentEval benchmark, but the blog and website do not describe how it was built: the data sources, whether records are real or synthetic, who authored the tasks and how personas were made are not public. We would rather reuse what exists than reinvent it.

Each question lists why it matters and **our default if we hear nothing**. If the default is fine, a short "agree" is enough. Sections 1 and 2 are mainly for the original PersonalAgentEval team; sections 3 to 5 for PALE maintainers.

**Top five, ideally answered in the meeting** (they shape week one): Q6, Q1, Q14, Q15, Q11.

## 1. How the closed benchmark's data was built

The blog says each task runs on "a fresh copy of the person's accounts" but not where those accounts and records come from. The MatrAIx persona dataset has human-grounded and synthetic records, but it is an attribute table without mail, bills or other life records, and the blog does not connect the two.

| # | Question | Why it matters | Default if no answer |
| :--- | :--- | :--- | :--- |
| Q1 | How were the accounts, emails, bills and other history records made: hand-written, LLM-generated, or adapted from real experiences? Is there a written generation process or prompt? | Decides whether the open version can reuse the method, and how the fact registry and consistency checks are designed | Build our own: test matrix, then generated records, then consistency checks |
| Q2 | Do user profiles come from the MatrAIx persona dataset? If so, what was added to go from 1,290 attributes to a usable person? | If an attribute-to-life-history method exists, ③ can reuse it | Sample attributes from Persona 1M as a base; ③ writes the life history |
| Q3 | The blog says every task was checked end to end by hand: by whom, against what checklist, and how long per task? | Sets the review workload and the self-check list for the open version | Use ③'s author checklist and ④'s reviewer checklist |
| Q4 | Were any real experiences used? If so, how were they de-identified, and were there any problems? | Sets the bar for the open version's privacy review | Accept only invented scenarios or ones transformed beyond recognition |
| Q5 | Will the closed tasks be released, or used in the open version's held-out set? | Avoids duplicate tasks and contamination of a held-out set | Treat them as unreleased; the open version writes its own tasks |

## 2. Simulated user and evaluation protocol

The blog says the user is played by a language model that answers questions and confirms actions but never volunteers what the records already hold, and that the simulated user was checked for fidelity. This is the first thing ③ has to settle, so this section has priority.

| # | Question | Why it matters | Default if no answer |
| :--- | :--- | :--- | :--- |
| Q6 | Which model and prompt played the user? How was "never volunteers" enforced and checked? How was fidelity measured? | Reuse instead of rebuilding; keeps open and closed scores comparable | LLM intent classification with scripted replies; vague questions get vague answers |
| Q7 | How does the user answer a vague question ("anything I should know?")? Did the simulated user ever leak a deciding fact, and how was that handled? | One leaked sentence invalidates a task | Answer "Nothing comes to mind"; a vague-question probe agent must score 0 on every task |
| Q8 | How much do scores vary across repeated runs of the same task? Is the leaderboard a single run or an average? | Determines whether "all runs fail" and "100% with the hint" can be met reliably | Pin model and version; run each task at least 5 times to measure variance |
| Q9 | Is grading purely programmatic, or partly LLM-judged? How are communication outcomes (did the agent tell the user, notify someone) graded? | Decides how strongly deciding facts must be tied to checkable actions | Programmatic hard checks; communication as soft checks with ④ defining the method |

## 3. Contribution entry points and credit

There are two entry points today: the old PersonalAgentEval contribute page, which collects tasks and experiences where agents failed, and the PALE GitHub flow, which takes full task proposals. How they relate is not stated.

| # | Question | Why it matters | Default if no answer |
| :--- | :--- | :--- | :--- |
| Q10 | Will the open version still collect failure experiences? If so, who converts them into tasks, and can ③ see the ones already received? | Existing experiences are a ready source of tasks and help calibrate the fact taxonomy | Keep collecting; ③ tags them by fact type and converts them into test matrices |
| Q11 | How are contributors credited if they submit only an experience or a test matrix, not a full task? The co-authorship bar currently counts accepted tasks only | Without an answer, light contributors leave, and the test-matrix path does not work | List them in acknowledgments; when an experience becomes an accepted task, record them as story contributors on it (opt-in, may be anonymous) |
| Q12 | Who performs the privacy review, and at which stage (proposal or before merge)? | ③'s checklist has privacy items that need to hand off to that review | ③ screens at proposal stage; maintainers review before merge |
| Q13 | Can one proposal include several counterfactual variants? Do variants count as one task or several? | CONTRIBUTING.md says cosmetic variations do not count as new tasks, but variants change a deciding fact | Variants are part of one task; it is resolved only if all variants are |

## 4. Task format, platform and validation

| # | Question | Why it matters | Default if no answer |
| :--- | :--- | :--- | :--- |
| Q14 | When will the first infrastructure release (user harness, scenario injection, interfaces) ship, and what should authors run on until then? | ③ committed to at least one executable task within two weeks | Harbor format plus a standalone MCP world service (the bills prototype runs this way); migrate after the release |
| Q15 | For cross-session memory, do we test the agent's own memory or history provided by the environment? | Harbor multi-step tasks start fresh by default. Agent-native memory is hard to control; environment history measures retrieval | Agent writes, environment stores, for multi-session tasks; label each task and report separately |
| Q16 | When will the evaluation roster be published, and who pays for the required GPT, Claude and Gemini runs? | Long multi-session tasks are expensive; community authors may not afford five runs per model | ③ runs the first three tasks itself and publishes the cost as a reference |
| Q17 | How are the public and held-out sets split? Should authors submit a private variant? | Public tasks will end up in training data; variants can give a held-out set a fresh surface | Keep one unpublished variant per test matrix, held by maintainers |

## 5. Persona and world

| # | Question | Why it matters | Default if no answer |
| :--- | :--- | :--- | :--- |
| Q18 | Can the open tasks share the website's persona, Lena? Which of her facts (city, family, work, finances) are fixed? | One shared persona means one data set and future cross-task memory tests, but it must not contradict the website | Start with a new invented persona and move to Lena once confirmed |
| Q19 | The MatrAIx persona dataset is licensed research-only. Can it seed personas in a publicly released benchmark? | If not, persona attributes need another source | Use it only as internal reference; write public persona details by hand |
| Q20 | How is the primary domain chosen for cross-domain tasks? For example, is "a flight change forces the pickup and rental car to change" Travel & commuting or Social & communities? | Affects the proposal list statistics and the coverage matrix | Choose the domain where the final state change happens |

## Sources

- [PersonalAgentEval blog](https://personalagenteval.com/blog/)
- [PALE page](https://personalagenteval.com/PALE)
- [PersonalAgentEval contribute page](https://personalagenteval.com/contribute/)
- [PALE contribution guide](../../CONTRIBUTING.md)
- [MatrAIx paper](https://www.alphaxiv.org/abs/2608.04205)
- [MatrAIx Persona 1M](https://huggingface.co/datasets/MatrAIx2026/MatrAIx_Persona_1M)
- [Harbor multi-step tasks](https://docs.harborframework.com/tasks/multi-step)
