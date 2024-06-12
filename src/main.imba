global css body c:warm2 bg:warm8 ff:sans inset:0 d:vcc

tag Countdown
	css button mr:1
	css h1 m:0 ta:center
	css .red bg:red
	
	count = 3
	<self autorender=1fps>
		<div.red=(count < 1) [p:3]>
			if count > 0
				minute = String(Math.floor count/60).padStart(2,'0')
				second = String(count % 60).padStart(2,'0')
				<h1> "{minute}:{second}"
				count -= 1
			else
				<h1> "Time up"
			<button @click=(count=30*60)> "30m"
			<button @click=(count=45*60)> "45m"
			<button @click=(count=60*60)> "60m"

tag App
	# def popup
	# 	a = window.open(document.location.href, 'mini', width=200, height=240)
	# 	a.resizeTo(250, 170)
	<self @click=popup!>
		<Countdown>
		# <button @click=resize!> "resize"
		# window.screen.availWidth

imba.mount <App>
