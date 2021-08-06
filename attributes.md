Attributes Reference
--------------------

### Attribute Syntax Overview

In K, many different syntactic categories accept _attributes_, an optional
trailing list of keywords or user-defined identifiers. Attribute lists have two
different syntaxes, depending on where they occur. Each attribute also has a
type which describes where it may occur.

The first syntax is a square-bracketed (`[]`) list of words. This syntax is
available for following attribute types:

1.  `module` attributes - may appear immediately after the `module` keyword
2.  `sort` attributes - may appear immediately after a sort declaration
3.  `production` attributes - may appear immediately after a production
    alternative
4.  `rule` attributes - may appear immediately after a rule
5.  `context` attributes - may appear immediately after a context or context
    alias
6.  `claim` attributes - may appear immediately after a claim

The second syntax is the XML attribute syntax, i.e., a space delemited list of
key-and-quoted-value pairs appearing inside the start tag of an XML element:
`<element key1="value" key2="value2" ... > </element>`. This syntax is
available for the following attribute types:

1.  `cell` attributes - may appear inside of the cell start tag in
    configuration declarations

### Attribute Index

We now provide an index of available attributes organized alphabetically
with a brief description. Where it is helpful, we may link to a longer
explanation which appears in the following subsections.

| Name                  | Type             | Backend | Effect                                                                                                 |
| --------------------- | ---------------- | ------- | ------------------------------------------------------------------------------------------------------ |
| `alias-rec`           | rule             | all     | This attribute describes an `alias` that may be applied recursively                                    |
| `alias`               | rule             | all     | This production is a `macro` that also is applied during unparsing                                     |
| `all-path`            | claim            | Haskell | To succesfully verify this claim, the prover must check that it holds on all execution paths           |
| `anywhere`            | rule             | all     | This rule may be applied anywhere, i.e., the rule is not lifted over the configuration                 |
| `applyPriority(_)`    | production       | all     | The parser must reject this production when lower precedence arguments occur at given positions        |
| `avoid`               | production       | all     | This production has lower precendence at parse time than other productions in the same priority level  |
| `binder`              | production       | all     | This production is binder-like; the built-in substitution operator must respect bound variables        |
| `bracket`             | production       | all     | This production is bracket-like; it only exists for grouping at parse-time                             |
| `color(_)`            | production       | all     | All terminals in this production are printed with the given color                                      |
| `colors(_)`           | production       | all     | All terminals in this production are printed with the given color list                                 |
| `concrete(_)`         | rule             | Haskell | This `simplification` rule only applies when the listed variables are concrete                         |
| `concrete`            | rule             | Haskell | This attribute is equivalent to `concrete(_)` with all variables listed                                |
| `context(_)`          | context          | all     | Used in `context alias`es only: cools the `HOLE` in a bound context into the given constructor         |
| `cool`                | rule             | all     | This rule is a cooling rule                                                                            |
| `exit = ""`           | cell             | all     | The `Int` value contained in this cell will be returned as the `krun` process's exit code              |
| `format`              | production       | all     | The unparser will print this production with colorization/indentation according to the given string    |
| `freshGenerator`      | production       | all     | This production of the form `X ::= F(Int)` will be used to generate fresh values of sort `X`           |
| `functional`          | rule             | all     | This production is interpreted as a total function                                                     |
| `function`            | rule             | all     | This production is interpreted as a partial function                                                   |
| `heat`                | rule             | all     | This rule is a heating rule                                                                            |
| `hook(_)`             | production       | all     | This function produnction is implemented by the named K runtime internal function                      |
| `hybrid(_)`           | production       | all     | For each listed sort `s`, this production belongs to `s` if its strict arguments belong to sort `s`    |
| `hybrid`              | production       | all     | This attribute is equivalent to `hybrid(KResult)`                                                      |
| `klabel(_)`           | production       | all     | This production's internal name is equal to the given identifier                                       |
| `latex(_)`            | production       | all     | This production's latex representation is the given string where `#N` refers to the `N`th argument     |
| `left`                | production       | all     | Nested copies of this production associate to the left                                                 |
| `lemma`               | rule             | all     | This attribute has no effect; it is a comment to the reader about the rule's purpose                   |
| `locations`           | sort             | all     | This attribute tells the parser to wrap terms in the given sort with location information              |
| `macro-rec`           | rule             | all     | This attribute describes a `macro` that may be applied recursively                                     |
| `macro`               | rule             | all     | This rule is only applied statically immediately after program parsing                                 |
| `memo`                | rule             | Haskell | Tells the backend to memoize all applications of this rule                                             |
| `multiplicity = "_"`  | cell             | all     | Valid configurations may only contain the given number of copies of this cell                          |
| `non-assoc`           | production       | all     | Nested copies of this production do not associate to the right or left                                 |
| `one-path`            | claim            | all     | To successfully verify this claim, the prover must check that it holds on at least one execution path  |
| `owise`               | rule             | all     | This attribute is equivalent to `priority(200)`                                                        |
| `prec(_)`             | token            | all     | In case of lexer ties, this token has the given precedence (higher numbers mean higher precendence)    |
| `prefer`              | production       | all     | This production has higher precendence at parse time than other productions in the same priority level |
| `priority(_)`         | rule             | all     | This rule will be executed with the given priority (lower numbered rules are attempted first)          |
| `result(_)`           | context, rule    | all     | This context or rule uses the given the sort used for heating and cooling tests                        |
| `right`               | production       | all     | Nested copies of this production associate to the right                                                |
| `seqstrict(_)`        | production       | all     | This attribute is like `seqstrict` but only the given argument positions will be evalated strictly     |
| `seqstrict`           | production       | all     | This production's arguments wll be evaluated strictly in declaration order                             |
| `simplification(_)`   | rule             | Haskell | This rule is a simplification with the given priority (lower numbered rules are attempted first)       |
| `simplification`      | rule             | Haskell | This attribute is equivalent to `simplification(50)`                                                   |
| `smt-hook(_)`         | production       | Haskell | The SMT representation of this production is the given term where `#N` refers to the `N`th argument    |
| `smt-lemma`           | rule             | all     | This rule is passed in encoded form to the SMT solver when attempting to check side-conditions         |
| `smtlib(_)`           | production       | Haskell | The SMT representation of this production is an uninterpreted function with the given name             |
| `strict(_)`           | production       | all     | This attribute is like `strict` but only the given argument positions will be evaluated strictly       |
| `strict`              | production       | all     | This production's arguments wll be evaluated strictly in any order                                     |
| `symbolic(_)`         | rule             | Haskell | This `simplification` rule only applies when the listed variables are symbolic                         |
| `symbolic`            | rule             | Haskell | This attribute is equivalent to `symbolic(_)` but with all variables listed                            |
| `symbol`              | production       | all     | The compiler will disable module and arity name-mangling for this production                           |
| `token`               | production       | all     | This production will not be parsed inside of rule bodies                                               |
| `token`               | sort             | all     | This sort is inhabited by only tokens or domain values                                                 |
| `trusted`             | claim            | Haskell | `kprove` will assume this claim and use it when proving other claims                                   |
| `type = "_"`          | cell             | all     | The compiler will check that this cell structure conforms to given type                                |
| `unboundVariables(_)` | rule             | all     | The compiler will ignore any of the given variables if they appear unbound on the RHS of this rule     |
| `unused`              | production       | all     | The compiler will warn if this production is used in any rule or context body                          |

### Internal Attribute Index

Some attributes should not generally appear in user code, except in some
unusual or complex examples. Such attributes are typically generated by the
compiler and used internally. We list these attributes below as a reference for
interested readers:

| Name       | Type(s)    | Backend | Description                                                                   |
| ---------- | ---------- | ------- | ----------------------------------------------------------------------------- |
| `assoc`    | production | all     | This production is semantically associative                                   |
| `comm`     | production | all     | This production is semantically commutative                                   |
| `idem`     | production | all     | This production is semantically idempotent                                    |
| `unit`     | production | all     | This production has a semantic identity                                       |
| `userList` | production | all     | This production describes a list defined via a `List` or `NeList` constructor |
