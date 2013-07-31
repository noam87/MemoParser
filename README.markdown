# MemoParser

A text parsing engine for [MemoRabble](https://github.com/CLUSTERfoo/MemoRabble).

## Objective

Given the following input:

```ruby

PLain text followed by markers: 

"@relationA:some_content, @relationA:more_content, @relationB:last_relation

#tagA:some_tag #tagB:another_tag."
```

Produce the following ruby hash as an output:


```ruby
{
  relations:
  {
    relationA: ["some_content", "more_content"],
    relationB: ["last_relation"]
  },
  
  tags: 
  {
    tagA: ["some_tag"],
    tagB: ["another_tag"]
  },
}
```

## Terms

The parser looks for *markers*. Markers take the form:

    (identifier)(label):(node)

For example:

    @user:clusterfoo
    #tag:cool_stuff

**Identifier:** 

This tells us what sort of marker it is. A 
relation ("`@`") or a tag  ("`#`").

**Labels and nodes:** 

If we imagine relationships between memos as a directed labeled graph, then the 
following marker:

    @comment:235

Denotes a relationship between the current memo (one node on a graph) and 
memo 235 (a second node), with the label "comment" (As in: the current memo
is a comment on memo 235). 