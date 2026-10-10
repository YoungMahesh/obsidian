[Supported Agents](https://github.com/vercel-labs/skills#supported-agents)

```bash
# install skills
npx skills add https://github.com/mattpocock/skills
# update skill
npx skills update https://github.com/mattpocock/skills
# remove skill
npx skills remove [skills]

# -g == global
# list current project skills
npx skills ls
npx skills ls -g
# upgrade all skills to latest version
npx skills@latest update
npx skills@latest update -g
# Search by keyword
npx skills find typescript
```

### Matt Pocock skills

#### intialize
```tui
# setup
/setup-matt-pocock-skills
# if you have any questions related to these skills
/ask-matt 
```

#### steps
```
# confirm both agent and you both have shared understanding
/grill-with-docs <task-you-want-to-do>
if (task is small enough that ai agent can complete in one go) {
	then use `/implement this` directly
} else {
	/to-spec # formalize discussions into specifications
	/to-tickets # slice specifications into tracer-bullet tickets with explicit blocking edges
	use /to-spec then /to-tickets
	# you can recursively use /to-spec, to-tickets to further breakdown task into small parts

	/clear # clear context

	recursively use - /implement and /clear
	# /implement will complete all changes at once 
	
	you can also use `/implement <number of ticket you want to implement>`
}
```
