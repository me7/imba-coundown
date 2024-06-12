global css body c:warm2 bg:warm8 ff:sans inset:0 d:vtl

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
	<self @click=popup!>
		<Countdown>

imba.mount <App>
