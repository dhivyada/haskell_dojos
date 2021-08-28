> Part 4.12

#Talk with a Haskell Teacher

[Professor Graham Hutton](http://www.cs.nott.ac.uk/~pszgmh/) from Nottingham University recently visited us at Glasgow. In fact, Graham got his [PhD](http://www.cs.nott.ac.uk/~pszgmh/bib.html#thesis) at Glasgow — many years ago. He runs a Functional Programming [research lab](http://fp.cs.nott.ac.uk/) in Nottingham, and he has recently released a [textbook about Haskell](http://www.cs.nott.ac.uk/~pszgmh/pih.html).

During Graham’s visit, Jeremy took him to the university canteen, and quizzed him about his experiences of teaching and researching with the Haskell language.


_JEREMY:_ Hi, Graham. Welcome to Glasgow. Good to see you. We should give your official title, Professor Hutton. Now I think you teach first years to program in Haskell in Nottingham University, don’t you?


_GRAHAM HUTTON:_ Yes.


_JEREMY:_ Do you think Haskell is a good first programming language to learn?


_GRAHAM HUTTON:_ I think I think it depends on the individual. What we find in Nottingham is some people who’ve done lots of programming before, it’s kind of hard to unwire their brain and get them to forget the imperative, loop-based, variable-based way of thinking.


_JEREMY:_ Which is totally different to our functional style.


_GRAHAM HUTTON:_ Which is totally different. And it takes a while for them to undo their brain. Whereas some people who have never seen any programming language before, they can get into the Haskell way of thinking straight away. And what we tend to find is people who can think abstractly, they’re the ones who can pick it up very, very easily.


_JEREMY:_ Yeah. OK. So there are certain notions that people really struggle with like recursion, for instance or other kinds of functional concepts that you wouldn’t see in an imperative language so readily. What do you do when people say, I don’t get this? How do you kind of coax them into a functional mind set?


_GRAHAM HUTTON:_ So I’ve thought about this for quite a long time because I’ve been teaching Haskell to the first years and second years for about 20 years. What I do with the students is three things. I say you should be very systematic about your learning. So when I teach Haskell, I teach it in a very kind of language-focused way at the start. So I teach the very basic concepts, the functions, list comprehensions, recursion, and so on. And I very much see this as a tower. You learn the simple things, then a little bit more, and then a little bit more. And the second thing I do to the students is say you must actually look at larger programming examples.

So in the new book, I’ve got about 20 larger programming examples. And I go through some of those with the students. And they see kind of code written by somebody who’s been doing this a long time. And I hope it gets them up to speed. And last thing, of course, I say to the students is you need to do a lot of programming yourself. So we sent them lots and lots of exercises in the labs and with course-works and so on. And they build up to writing larger programs themselves.


_JEREMY:_ I think that’s good. There’s got to be a balance between reading code and writing code yourself.


_GRAHAM HUTTON:_ Yes.


_JEREMY:_ Both things are important–


_GRAHAM HUTTON:_ Absolutely.


_JEREMY:_ –to build an understanding of language. That’s good. That’s what we’re trying to do in our course. Now you mentioned your new book there. This is the Glasgow leg of your book tour.


_GRAHAM HUTTON:_ Yes.


_JEREMY:_ Can you tell us something about your Haskell textbook?


_GRAHAM HUTTON:_ Yes. So this is the new book, which is just out. So I’ve been teaching Haskell for 20 years. So I’ve got lots of experience with this. And I love Haskell. And I love teaching it to people. And I want everyone to learn Haskell. So that’s why I’ve produced a second edition of the book. It’s divided into two parts. It’s got some introductory material in the first half of the book.


_JEREMY:_ So you could pick up this book if you weren’t a programmer or you haven’t done programming before?


_GRAHAM HUTTON:_ Absolutely. So the book is aimed at basically anybody. So what it says in the preface is anybody over the age of 16 with a reasonable aptitude for scientific ideas could pick up a book like this and learn some Haskell from it. So it’s not necessarily aimed at professional programmers or students or laypeople. It’s aimed at basically anybody. So one half focuses on the basics. And it does it in this very systematic way, which I was talking about. So it covers the very basics of types and functions and list comprehensions and so on. And it builds up to more complicated things.

And then the second half of the book covers some of the more advanced topics that might be in, for example, a second course on functional programming like reasoning about programs, programming with monads, with applicative functors, with functors, foldables, traversables. All the kind of newer stuff in Haskell.


_JEREMY:_ OK. Good. So a recommended read. Good. In Nottingham, you’ve got a functional programming lab.


_GRAHAM HUTTON:_ Yes


_JEREMY:_ And you have large team of people–


_GRAHAM HUTTON:_ Yes.


_JEREMY:_ –working with you there.


_GRAHAM HUTTON:_ Yes.


_JEREMY:_ What is it about Haskell that is particularly attractive in terms of research, a vehicle for doing interesting programming language experiments?


_GRAHAM HUTTON:_ That’s a very good question. So I think for me, it’s the balance of being a very nice theoretical vehicle for studying programming language principles and kind of advancing that. But it’s also, on the other hand, a very practical language for writing real world applications. And I think that’s one of the things which is very exciting about the Haskell community. I mean it’s been going for about 30 years. And for the first maybe 15 or so years, it was very much an academic pursuit. And people like me were interested in writing academic papers about Haskell. And in the last 15 years and really in the last five years, things have really taken off.

And people who have no interest in this kind of language technology are now getting interested in it. And it’s become one of the hot languages that people want to learn. There’s quite a few jobs now. And we tell our students now that there’s a realistic chance if they want that they can get a job in Haskell afterwards. So it’s a really nice language to do research on because it’s both at the cutting edge of programming language research and also at the cutting edge of practice. I mean people in the real big players like the Facebooks, the Googles, the Microsofts, they’re writing real production software now using this cutting edge language technology.

So it’s a really nice research field to be in.


_JEREMY:_ I want to pick up on something you mentioned there about the sense of community around Haskell and functional programming. I get the impression that there does seem to be more of a kind of gregarious and social nature to the Haskell community and online forums and news groups and so on. Have you picked up on that? And if so, why? Why is functional programming so friendly?


_GRAHAM HUTTON:_ Absolutely. I mean that’s one of the reasons I became a functional programmer. My PhD wasn’t in that area. And I migrated to that afterwards. And it was partly because it was such a friendly community. I mean there’s lots of things going on, lots of forums, lots of newsgroups, meet ups, and things like that. It’s a really nice community to be part of. And I think the reason it’s developed like that is that it grew out from a core of about 20 or so people who started the Haskell language about 30 years ago. And they all shared this common vision. And they’re all very nice people as well.

And as the community has grown, they’ve wanted to keep this ethos, I think. So I think it’s that the people who started it were very nice and very, very clever people. And they wanted to keep that kind of nice community as a group.


_JEREMY:_ That’s a good atmosphere. So people who use programming languages turn out like the people who invented the programming languages. [LAUGHTER] Very good. OK. Last question. This is about maybe a fun or interesting Haskell application that you’ve developed. Can you tell us something about a large piece of code that you’ve written in Haskell that’s just something cool?


_GRAHAM HUTTON:_ So I think the one I’d pick up on is actually one that’s in the book, fortuitously enough, which is the countdown problem. And the idea is you’re given a collection of numbers, maybe six numbers. And you’re given the target number. And you need to build a simple arithmetic expression that evaluates to that target number. And I use this as an example in the book because it kind of illustrates many of the interesting things about functional programming. So what I do in the book is I start off with a kind of high level specification for what it means to solve this problem.

And then in a series of simple steps, I show how you can end up with an extremely efficient program that can solve any of these number games as soon as you basically hit the Return key. So I think, for me, this is a nice example of functional programming. Because it takes a problem which everyone is familiar with– a simple numbers game from the TV– and it shows how, in a very systematic way, you can write a very, very efficient program to solve it and end up with something quite interesting to look at and fun to look at. And I’ve been teaching that example to my first years for many years. And they always find this one quite engaging.


_JEREMY:_ Yeah. That’s nice. So we’re saying Haskell is both fun and elegant.


_GRAHAM HUTTON:_ Well, it’s fun, elegant, and practical. That’s why it’s such a nice field to be in at the moment.


_JEREMY:_ Thanks, Graham.


_GRAHAM HUTTON:_ Thanks very much, Jeremy. 