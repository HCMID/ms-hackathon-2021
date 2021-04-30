---
title: "XML usage"
layout: page
nav_order: 5
---



# Concise summary of typical XML usage


Our XML markup falls in 4 tiers:

1. *transcription level*: markup we use to indicate the editorial status of our reading
2. *tokenization level*: words, numbers, abbreviations, scribal multiforms, or other tokens that our parser should recognize as a single unit
3. *editorial disambiguation level*: named entities
4. *discourse disambiguation*: quotations and citable references. (*NB*: we don't expect to find any examples in our work on the *Aratus Latinus*)

At each level, the following TEI elements are allowed:


**Transcription level**

| Element | Meaning | Example | Comments |
| ---: | :--- | :---: | :--- |
| `unclear` | There are traces of a letter or letters, but not enough to be certain how to read them. | `<unclear>et</unclear>` | Some traces visible, you think the reading is ***et*** |
| `gap` | Letters are missing or completely illegible due to damage | `<gap/>` | Note that `gap` is an empty element with no content, |
| `del` | Text deleted by scribe (e.g., with underdots) | `et <del>et</del>` | The scribe deleted the second ***et*** |
 `add` | Text added by script (eg, above line) | `<add>et</add>` | ***et*** was not part of the original text but was added by the scribe |


**Tokenization level**

| Element | Meaning | Example | Comments |
| ---: | :--- | :---: | :--- |
| `num` | One or more numeric characters. | `<num value="7">VII</num>` | Put the numeric value in the `value` attribute. Note that you should *not* tag number words like ***septem***!|
| `w` | Wrap any word that is broken up by markup.  | `<w>stell<unclear>as</unclear></w>` | The letters ***as*** are unclear, but we want our parser to recognize ***stellas*** as a single word. 
| `choice` containing `abbr` and `expan` | Text includes an abbreviation; you are including an expansion for it | `<choice><abbr>dr</abbr><expan>dicitur</expan></choice>` | The scribe writes ***dr*** (perhaps including a distinct mark signaling an abbreviation); you interpret it to mean ***dicitur*** |
| `choice` containing `sic` and `corr`  | Scribe deletes original reading, inserts a correction | `<choice><sic>medios</sic><corr>medias</corr></choice>` | Scribe orginally wrote ***medios*** but changed the text to ***medias*** |
| `choice` containing `orig` and `reg`  | Scribe offers an alternate second reading without deleting the original reading. | | `<choice><orig>eam</orig><reg>Helicem</reg></choice>`| Scribe wrote ***eam*** in the main text, then added ***helicem*** as an alternative above it, but did not delete ***eam***. |


**Editorial disambiguation level**

Named entities with `@n` attribute with URN value:


| Element | Meaning | Example | Comments |
| ---: | :--- | :---: | :--- |
|  `persName` | Proper name of a person | `<persName n="urn:cite2:hmt:persname.v1:pers1">Achilles</persName>` | Include a URN value in the `n` attribute |
| `placeName` | Proper name of a place (real or imaginary) | `<placeName n="urn:cite2:hmt:place.v1:place1">Athenas</placeName>` |  Include a URN value in the `n` attribute |



**Discourse level**

While we're unlikely to find quoted text in the *Aratus Latinus*, we include for reference these notes on how the Homer Multitext project encodes quoted text.

- `q` alone:  
    - quotation, work not extant
    - quoted example of language. Test: you would not  translate this when reading the text, e.g. explaining the declension of a noun by using another common word as an example
- `cit` containing `q` and `ref`: quotation of extant work
- `title` with either CTS URN (extant work) or CITE2URN
- `rs` with `type="waw"` quoted expression not parseable as  a Greek word, e.g. "the letter σ"


