# Contributing to MLDev

:+1: :tada: First off, thanks for taking the time to contribute! :tada: :+1:

The following is a short set of guidelines for contributing to MLDev project, which are hosted in the [MLRep](https://gitlab.com/mlrep) on GitLab. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

#### Table Of Contents

[How to ask questions?](#how-to-ask-questions)

[How can I contribute?](#how-can-i-contribute)
  * [Reporting Bugs](#reporting-bugs)
  * [Suggesting Enhancements](#suggesting-new-features-and-enhancements)
  * [Merge Requests](#merge-requests)

[Styleguides](#styleguides)
  * [Git Commit Messages](#git-commit-messages)


[Issue and Pull request labels](#issue-labels)


## How to ask questions?

> **Note:** [Please don't file an issue to ask a question.] You'll get faster results by using the resources below.

* [MLDev chat on Telegram](https://t.me/mldev_Betatest)


## How Can I Contribute?

### Reporting Bugs

This section guides you through submitting a bug report for MLDev. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior :computer: :computer:, and find related reports :mag_right:.

Before creating bug reports, please check [this list](#before-submitting-a-bug-report) as you might find out that you don't need to create one. When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report). Fill out [the required template](https://gitlab.com/mlrep/-/blob/master/.gitlab/issue_templates/Bug.md), the information it asks for helps us resolve issues faster.

> **Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.

#### Before Submitting A Bug Report

* **Check the [FAQs](TODO)** for a list of common questions and problems.
* **Determine [which repository the problem should be reported in](#project-structure)**.
* **Perform a [cursory search](https://gitlab.com/search?scope=issues&group_id=8465520)** to see if the problem has already been reported. If it has **and the issue is still open**, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Bug Report?

Bugs are tracked as [GitLab issues](https://docs.gitlab.com/ee/user/project/issues/). After you've determined [which repository](#project-structure) your bug is related to, create an issue on that repository and provide the following information by filling in [the template](https://gitlab.com/mlrep/-/blob/master/.gitlab/issue_templates/Bug.md).

Explain the problem and include additional details to help maintainers reproduce the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you started Atom, e.g. which command exactly you used in the terminal, or how you started Atom otherwise. When listing steps, **don't just say what you did, but explain how you did it**. For example, if you moved the cursor to the end of a line, explain if you used the mouse, or a keyboard shortcut or an Atom command, and if so which one?
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples. If you're providing snippets in the issue, use [Markdown code blocks](https://about.gitlab.com/handbook/markdown-guide/#code-blocks).
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **Include screenshots and animated GIFs** which show you following the described steps and clearly demonstrate the problem. If you use the keyboard while following the steps, **record the GIF with the [Keybinding Resolver](https://github.com/atom/keybinding-resolver) shown**. You can use [this tool](https://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux.


### Suggesting New Features and Enhancements

This section guides you through submitting an enhancement suggestion for MLDev, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:.

Before creating enhancement suggestions, please check [this list](#before-submitting-a-feature-suggestion) as you might find out that you don't need to create one. When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-suggestion). Fill in [the template](https://gitlab.com/mlrep/-/blob/master/.gitlab/issue_templates/Feature.md), including the steps that you imagine you would take if the feature you're requesting existed.

#### Before Submitting A Feature Suggestion

* **Determine [which repository the enhancement should be suggested in](#project-structure).**
* **Perform a [cursory search](https://gitlab.com/search?scope=issues&group_id=8465520)** to see if the enhancement has already been suggested. If it has, add a comment to the existing issue instead of opening a new one.

#### How Do I Submit A (Good) Feature Suggestion?

Feature suggestions are tracked as [GitLab issues](https://docs.gitlab.com/ee/user/project/issues/). After you've determined [which repository](#project-structure) your feature suggestion is related to, create an issue on that repository and provide the following information:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested feature** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://about.gitlab.com/handbook/markdown-guide/#code-blocks).
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Include screenshots and animated GIFs** which help you demonstrate the steps or point out the part of Atom which the suggestion is related to. You can use [this tool](https://www.cockos.com/licecap/) to record GIFs on macOS and Windows, and [this tool](https://github.com/colinkeenan/silentcast) or [this tool](https://github.com/GNOME/byzanz) on Linux.
* **Explain why this feature would be useful** to most Atom users and isn't something that can or should be implemented as a [community package](#atom-and-packages).
* **List some other related tools or applications where this feature exists.**


### Merge Requests

The process described here has several goals:

- Maintain MLDev's quality
- Fix problems that are important to users
- Engage the community in working toward the best possible Atom
- Enable a sustainable system for MLDev's maintainers to review contributions

Please follow these steps to have your contribution considered by the maintainers:

1. Follow all instructions in [the template](https://gitlab.com/mlrep/-/blob/master/.gitlab/merge_request_templates/Merge.md)
2. Follow the [styleguides](#styleguides)
3. After you submit your merge request, verify that all [pipelines and CI jobs](https://docs.gitlab.com/ee/ci/pipelines/) are passing

While the prerequisites above must be satisfied prior to having your merge request reviewed, the reviewer(s) may ask you to complete additional design work, tests, or other changes before your pull request can be ultimately accepted.

## Styleguides

### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line
* Consider starting the commit message with an applicable emoji:
  * :art: `:art:` when improving the format/structure of the code
  * :racehorse: `:racehorse:` when improving performance
  * :non-potable_water: `:non-potable_water:` when plugging memory leaks
  * :memo: `:memo:` when writing docs
  * :penguin: `:penguin:` when fixing something on Linux
  * :apple: `:apple:` when fixing something on macOS
  * :checkered_flag: `:checkered_flag:` when fixing something on Windows
  * :bug: `:bug:` when fixing a bug
  * :fire: `:fire:` when removing code or files
  * :green_heart: `:green_heart:` when fixing the CI build
  * :white_check_mark: `:white_check_mark:` when adding tests
  * :lock: `:lock:` when dealing with security
  * :arrow_up: `:arrow_up:` when upgrading dependencies
  * :arrow_down: `:arrow_down:` when downgrading dependencies
  * :shirt: `:shirt:` when removing linter warnings



## Issue and Pull Request Labels

This section lists the labels we use to help us track and manage issues and pull requests. Most labels are used across all MLRep repositories, but some are specific to MLDev.

[GitLab search](https://docs.gitlab.com/ee/user/search/) makes it easy to use labels for finding groups of issues or merge requests you're interested in.  To help you find issues and merge requests, each label is listed with search links for finding open items with that label in `mlrep` repositories.

The labels are loosely grouped by their purpose, but it's not required that every issue have a label from every group or that an issue can't have more than one label from the same group.

Please open an issue on `mlrep/mldev` if you have suggestions for new labels, and if you notice some labels are missing on some repositories, then please open an issue on that repository.

#### Type of Issue and Issue State

| Label name | `mlrep` :mag_right: | Description |
| ------ | ------ | ------ |
| `enhancement` | [search][search-mlrep-label-enhancement] | Feature requests. |
| `bug` | [search][search-mlrep-label-bug] | Confirmed bugs or reports that are very likely to be bugs. |
| `discussion` | [search][search-mlrep-label-question] | Questions more than bug reports or feature requests (e.g. how do I do X). |
| `feedback` | [search][search-mlrep-label-feedback] | General feedback more than bug reports or feature requests. |


#### Topic Categories

| Label name | `mlrep` :mag_right: | Description |
| ------ | ------ | ------ |
| `tool` | [search][search-mlrep-label-tool] | [search][search-atom-org-label-windows] | Related to `mldev` tool itself. |
| `templates` | [search][search-mlrep-label-templates] | Related to repo templates for `mldev` |
| `documentation` | [search][search-mlrep-label-documentation] | Related to any type of documentation |


[search-mlrep-label-enhancement]: https://gitlab.com/groups/mlrep/-/issues?scope=all&label_name[]=enhancement
[search-mlrep-label-bug]: https://gitlab.com/groups/mlrep/-/issues?scope=all&label_name[]=bug
[search-mlrep-label-question]: https://gitlab.com/groups/mlrep/-/issues?scope=all&label_name[]=discussion
[search-mlrep-label-feedback]: https://gitlab.com/groups/mlrep/-/issues?scope=all&label_name[]=feedback
[search-mlrep-label-tool]: https://gitlab.com/groups/mlrep/-/issues?scope=all&label_name[]=tool
[search-mlrep-label-templates]: https://gitlab.com/groups/mlrep/-/issues?scope=all&label_name[]=templates
[search-mlrep-label-documentation]: https://gitlab.com/groups/mlrep/-/issues?scope=all&label_name[]=documentation

## References

This guide was adapted from an [excellent one](https://github.com/atom/atom/blob/master/CONTRIBUTING.md) by `atom` team.