[Supported Agents](https://github.com/vercel-labs/skills#supported-agents)

```bash
# install skills
# - GitHub shorthand (owner/repo)
npx skills add vercel-labs/agent-skills
# - Full GitHub URL
npx skills add https://github.com/mattpocock/skills
# add skill to antigravity-cli 
ln -s ~/.agents/skills ~/.gemini/antigravity-cli/skills

# remove skill
npx skills remove [skills]
# update skill
npx skills update [skills]
# list current project skills
npx skills ls
# list global skills
npx skills ls -g
# filter skills by specific agent
npx skills ls -a opencode 
npx skills ls -a antigravity-cli
npx skills ls -a zed
npx skills ls -a claude-code
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