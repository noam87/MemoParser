# MemoParser

A test parsing engine for [MemoRabble](https://github.com/CLUSTERfoo/MemoRabble).
It looks for markers (defined below) within a string and renders them in 
various useful ways.

## MemoParser.to_hash

Given the following input:

```ruby

"PLain text followed by markers: 

@relationA:some_content, @relationA:more_content, @relationB:last_relation

#tagA:some_tag #tagB:another_tag."
```

Produces the following ruby hash as an output:


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


## Definition of a marker:

The parser looks for *markers*. Markers take the form:

    (identifier)[(label):](node)

or, as defined by the following ruby regular expression:

    ([@#])((\w+):)?(\w+)

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


## TODO: MemoParser.marker_links

Given that same original string, produce the following string as an output:

```ruby

"PLain text followed by markers: 

<a href="link_to_memo_id">@relationA:some_contenti</a>, 
<a href="link_to_memo_id">@relationA:more_content</a>, 
<a href="link_to_memo_id">@relationB:last_relation</a>

#tagA:some_tag #tagB:another_tag."
```
