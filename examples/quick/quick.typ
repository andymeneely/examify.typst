#import "@local/exam:0.1.0": *

= Final Exam, #total_points() points and #num_questions() questions
// <show_solutions> //uncomment for answer key

Name: #blank(4cm)

#question[
	#points(2)
	Hello, #fill_in_blank(3cm, [world!])
]

#question[
	#points(3)
	Speak friend and enter.
	#solution(height: 2.5cm, [melloch])
]

#question[
	#points(2)
	#choices[
		+ #correct[Right]
		+ Wrong
	]
]