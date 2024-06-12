global css body c:warm2 bg:warm8 ff:sans inset:0 d:vtl

tag Countdown
	css button mr:1
	css h1 m:0 ta:center
	css .red bg:red

	def getEndTime minute
		return Date.now! + (minute * 60_000) # ms

	endTime = getEndTime 3
	<self autorender=2fps>
		let endTimeStr = new Date(endTime).toLocaleTimeString!
		let timeLeft = endTime - Date.now!
		<div.red=(timeLeft < 1) [p:3]>
			<div[ta:center]> "End {endTimeStr}"
			if timeLeft > 0
				let second = String(Math.floor(timeLeft / 1000) % 60).padStart(2,'0')
				let minute = String(Math.floor(timeLeft /60_000)).padStart(2,'0')
				<h1> "{minute}:{second}"
			else
				<h1> "Time up"
			<button @click=(endTime = getEndTime 30)> "30m"
			<button @click=(endTime = getEndTime 45)> "45m"
			<button @click=(endTime = getEndTime 60)> "60m"

tag App
	<self @click=popup!>
		<Countdown>

imba.mount <App>
