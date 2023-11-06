# `exam` Typst Package

A collection of methods to help you build exams!

* Keep a catalog of your questions in separate files!
* Add up the points automatically using `#points()` and `total_points()`!
* Count your questions automatically with `#num_questions()`!
* Do `#fill_in_blank()` questions, with answer key
* A regular `#blank()` for names and stuff
* A `#correct(content)` method to highlight multiple choice
* A `#solution()` box that's blank on the student version and shows your solution in the answer key
* Build your answer key by adding a `<show_solutions>` label.
* A `#choices()` block for numbered lists
* Questions don't break across pages because of `#question[]`!
* Questions take up the same amount of space as their solutions, so your page numbers remain the same when grading!
* A workflow that has worked for actual college exams for over a decade!

Inspired by LaTeX's `exam.cls` template and [tutor](https://github.com/rangerjo/tutor)

# Installation

TBD...

# Usage

## Quick Example

```typst
#import "@local/exam:0.1.0": *

= Final Exam, #total_points() points and #num_questions() questions
<show_solutions> //comment out for student version

Name: #blank(4cm)

#question[
	#points(2)
	Hello, #fill_in_blank(3cm, [world!])
]

#question[
	#points(3)
	Speak friend and enter.
	#solution(height: 0.5cm, [melloch])
]

#question[
	#points(2)
	#choices[
		+ #correct[Right]
		+ Wrong
	]
]
```

This example lives in [examples/quick](examples/quick).

## Full Example

We recommend a file structure that looks like this.

```
├── example_exam.typ
├── example_exam_solutions.typ
└── questions
	├── .gitignore
    ├── hello_world.typ
    └── lorem_ipsum.typ
```

Your solutions file should just `include` your main file, and include the `<show_solutions>` label. Like this:

```typst
#include "example_exam.typ"
<show_solutions>
```

And then your main file looks something like:

```
#import "@local/exam:0.1.0": *
#import "./questions/hello_world.typ" as hello_world
#hello_world
```

This allows you to **automatically build two PDFs** without a build system.

This example lives in [examples/full](examples/full).

# API

TBD

# Is this actually useful?

Yes! I'm a college professor and I've used the `exam.cls` pacakge for over a decade now on hundreds and hundreds of paper exams. I have a massive library of questions, and I just include each file as needed for the exams - much like the "full" example above.

This approach works beautifully for a variety of reasons:
* I have my questions in one place so I can correct and improve them.
* I can have comments in the question file about how the question went (e.g. `// Fall 2023: a lot of people missed this!`)
* Being text-friendly I can put it all in version control
* It looks nice and professional.

The only problem is that I'm so very very sick of LaTeX. So now I'm trying out Typst!

# Known Issues

* This package is not guaranteed to get you tenure
* You'll need to actually know the answers to the questions you ask