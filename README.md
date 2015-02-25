orts
===============
We are trying to create the perfect open real tibia server based on [The Forgotten Server 1.1](https://github.com/otland/forgottenserver) by [Mark Samman](https://github.com/marksamman).

For more information about TFS 1.1 (including compiling guides) visit the link above.

You can download TFS 1.1 Windows binaries from http://nightlies.otland.net. (not always up to date!)

To login you can use [Otclient](https://github.com/edubart/otclient) by [edubart](https://github.com/edubart).

- Client Version: **10.41**
- Map Version: **10.35**
- The map is available at [orts/map](https://github.com/orts/map)

You can use our [forum thread](http://otland.net/threads/best-released-rlmap-10-41-based-1-0-new-roshamuul-new-quests-optimized-bug-fixing-open-source.204514/) at Otland to discuss and report bugs.

If you need support you can post your questions in the issues area or use [Otland's support board](http://otland.net/forums/support.16/). Do not forget to post in good, understandable English and include all the information needed to solve the problem.

### Script Contribution
In order to contribute scripts to this project [create a pull request](http://otland.net/threads/contributing-to-someones-repository-create-a-pull-request-on-github.210627/).

**Important:**
- Scripts should follow this [lua style guide](https://github.com/Olivine-Labs/lua-style-guide) and be as efficient as possible.
- Use tabs as indentation.
- Use new metatable functions or you have to revise your pull request.

**Example script (using metatables):**
```lua
local player = Player(cid)
if not player then
	return true
end

player:addItem(2160, 5)
player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Here is some cash.')
```

**Scripting related links:**
- [Script Interface](https://github.com/otland/forgottenserver/wiki/Script-Interface)
