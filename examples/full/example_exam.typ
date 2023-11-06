#import "@local/exam:0.1.0": *

#import "./questions/hello_world.typ" as hello_world
#import "./questions/lorem_ipsum.typ" as lorem_ipsum

#cover_sheet[
	= Introduction to Exams
	= Final Exam
	= Professor Plum

	#v(3cm)

	Name: $underline(#h(12cm))$

	#v(3cm)

	- Answer the questions in the spaces provided.
	- This exam has #num_questions() questions and totals to #total_points() points
]

#pagebreak()

#hello_world
#lorem_ipsum



