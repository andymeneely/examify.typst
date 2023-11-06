#let showing_solutions(loc) = {
	query(<show_solutions>, loc).len() > 0
}

#let cover_sheet(content) = {
	show heading: content => {
		set align(center)
		set text(weight: "bold")
		content
	}
	v(5cm)
	align(content)
}

#let points(num) = {
  let total = state("totalpoints", 0.0)
  total.update(total => total + num)
  [(#num point#if num != 1 [s])]
}

#let sub_points(num) = {
  [(#num point#if num != 1 [s])]
}

#let choices(content) = {
	v(3mm)
	set enum(numbering: "A. ", indent: 10mm)
	content
}

#let correct(content) = {
	locate(loc =>
		if showing_solutions(loc) {
			rect(content, radius: 6pt, inset: 0cm, outset: 0.1cm)
		} else {
			content
		}
	)
}


#let question(content) = {
	let qnum = state("question_number", 0)
	qnum.update(qnum => qnum + 1)
	set list(indent: 0.5cm)
	block({
		qnum.display()
		[. ]
		content
	}, breakable: false
	)
}

#let sub_question(content) = {
	let sub_qnum = counter("sub_question_number")
	sub_qnum.step()
	set list(indent: 0.5cm)
	pad(left: 1cm, {
		sub_qnum.display("a.")
		content
	})
}

#let solution(content, height: 3cm) = {
	locate( loc =>
		if showing_solutions(loc) {
			align(center,rect(content, height: height, radius: 6pt))
		} else {
			rect([], height: height, stroke: none)
		}
	)
}

// Go to the end of the document and calculate the final value
#let num_questions() = {
	locate(loc =>  state("question_number").final(loc) )
}

// Go to the end of the document and calculate the final value
#let total_points() = {
	locate(loc => state("totalpoints", 0.0).final(loc))
}

#let blank(len) = {
	$underline(#h(len))$
}

#let fill_in_blank(len, answer) = {
	locate( loc =>
		if showing_solutions(loc) {
			$underline(answer)$
		} else {
			$underline(#h(len))$
		}
	)
}