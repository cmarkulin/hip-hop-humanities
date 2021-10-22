# Basic Regex To Aid in the Markdown of Hip-Hop Songs

---

### Things to manually do:

- Wrap the entire text in a `<song></song>` root element 
- Because the songs should (hopefully) not be that long, manually tag the verses, bridges, and Choruses, outros and intros, if any.

### Tagging Lines:
Because we are marking up song lyrics, everything (in terms of lyrical content) needs to be tagged
as a line, which can be done as follows: 

###### Regex Commands For Tagging Each Individual Line:
1. `command f`
1. `Find (.+) to match one or more instances of any character except a new line `
1. `Then use the Replacement Command: <line>\0</line>`

**Note this may tag things that are not lines as lines, but since these are just song lyrics
hopefully you wont have to hunt too far and wide to find these intences, just manually delete where this happens**

### Tagging Background Vocals
Consider all of the vocals that are within () to be backing vocals, as they typically happen
in the background or are not the main focus, also we should remove the (), as they are technically metadata that we dont really care about.

###### Regex Commands For Tagging Background Vocals:
1. `command f`
1. `Find \(([^)]+)\)`
1. `Then Use The Replacement Command: <background>\1</background>`

### Adding The Attributes

Every verse should have three attributes: vocals, mood, and tone. Here are the Regex commands to add them
**Note: All attributes in all of the markup should be in LOWERCASE**

###### Regex Commands To Add Intro Attributes :

1. `Command F`
1. `Find <intro>`
1. `Then use the replacement Command: <intro vocals="" mood="" tone="">`
1. Add the respective words within the quotes

###### Regex Commands To Add Verse Attributes :

1. `Command F`
1. `Find <verse>`
1. `Then use the replacement Command: <verse vocals="" mood="" tone="">`
1. Add the respective words within the quotes

###### Regex Commands To Add Chorus Attributes :

1. `Command F`
1. `Find <chorus>`
1. `Then use the replacement Command: <chorus vocals="" mood="" tone="">`
1. Add the respective words within the quotes

###### Regex Commands To Add Outro Attributes :

1. `Command F`
1. `Find <outro>`
1. `Then use the replacement Command: <outro vocals="" mood="" tone="">`
1. Add the respective words within the quotes

#### Reserved Characters:
 There may be ceratain characters within the song lyrics that have a special meaning within XML, 
 therefore we must find them and replace them with how they should be displayed in XML. Look for and replace them as 
 needed. These special characters include: < and & 

###### Replacement Regex Commands For Special Characters:
 1. `command f`
 1.  `Find & or <`
 1. `Replace & With: &amp;`
    `Replace < With: &lt;`


