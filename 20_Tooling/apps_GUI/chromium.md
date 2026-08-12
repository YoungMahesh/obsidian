#app/browser 

[[chromium-extensions]]

## search directly in gemini 

Type **`@g`** (@gemini) in the address bar -> hit **Tab** -> type your prompt -> **Enter**

---


## Take screenshot

### full-size 
#screenshot 
1. open console `ctrl + shift + j`
2. open command menu `ctrl + shift + p`
	- if did not worked, Look at the top-right corner of the **Developer Tools panel** and click
3. search `screenshot`
4. select **Capture full size screenshot** if you want whole page (all scroll page)

### node
1. right-click on UI element
2. click inspect to open locate that element in HTML DOM
3. right-click on element in DOM
4. click 'Capture node screenshot'

## installation and config
### snap-store
- installation: https://snapcraft.io/chromium
- config file: `~/snap/chromium/common/chromium`
