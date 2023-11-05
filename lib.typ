#let cfg = toml("exam.toml")
#(cfg.solutions = true) // set to true for building answers

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
	if cfg.solutions {
		rect(content, radius: 6pt, inset: 0cm, outset: 0.1cm)
	} else {
		content
	}
}

#let question(content) = {
	let qnum = counter("question_number")
	qnum.step()
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
		[. ]
		content
	})
}

#let solution(content, height: 3cm) = {
	if cfg.solutions {
		align(center,rect(content, height: height, radius: 6pt))
	} else {
		rect([], height: height, stroke: none)
	}
}

// Go to the end of the document and calculate the final value
#let num_questions() = {
	locate(loc => { state("question_number", 0.0).final(loc) })
}

// Go to the end of the document and calculate the final value
#let total_points() = {
	locate(loc => { state("totalpoints", 0.0).final(loc) })
}

#let blank(len) = {
	$underline(#h(len))$
}

#let fill_in_blank(len, answer) = {
	if cfg.solutions {
		$underline(answer)$
	} else {
		$underline(#h(len))$
	}
}