## ANKI vocabulary
This documents a pipeline for importing vocab to ANKI
 - The prompt will specify a requested a list of French / English vocabulary
 - Please prepare an ANKI import file of the requested vocabulary in this format
 - All English and French words should be lower case except proper nouns
 - Bear in mind that I am learning to communicate in spoken French, not studying for a written exam

### File specification
 - The filename must be vocab.txt
 - Encoding must be UTF-8

### Contect specification
 - Each item of vocabulary should be on a separate line 
 - Do not include any headings
 - Do not leave any blank lines  
 - Each vocabulary item is laid out in fields
 - Field should be separated by `|` (pipe character)  
 - Do not include any notes or comments after the fields  
 - Please check for and elimiate duplicates
 
 ### List of fields
 1. English
 2. French
 3. Part (one of the following)
    - n. 
    - v.
    - adj.
    - adv.
    - prep.
    - pro.
    - conj.
    - conj. + subj.
 4. Gender (one of the following or empty)
    - m.
    - f.
    - m. pl.
    - f. pl.
 
## Special instructions for verbs
For the English, write the infinitive
For the French, write the following four parts separated by commas
 - the first person singular
 - the first person plural
 - the infinitive
 - the past participle
Examples
 - je regarde, nous regardons, regarder, regardé
 - je suis, nous sommes, être, été
 
## Special instructions for nouns

1. English nouns must include an indefinite article.
   - Use “a /an” for countable nouns.  
     - Examples: "a tyre, a bolt, a spoke"
   - Use “some” for uncountable nouns.  
     - Examples: "some petrol, some dust, some pressure

2. French nouns must use the natural spoken form.
   - Use “un / une” for countable nouns.  
     - Examples: "un pneu, un boulon, un filtre à air"
   - Use the partitive article ("du / de la / de l’") for uncountable nouns.  
     - Examples: "de l’essence, de la poussière, du graissage, du nettoyage

3. Use either the singular or the plural, whichever is more common, but not both.
    - Example, use:
        - a vegetable|un légume|n.|m.
    - but do not also include
        - vegetables|des légumes|n.|m. pl.
        
4. The part field and gender field remain unchanged.
   - Examples:  
     - un pneu|n.|m. 
     - de l’essence|n.|f.  
     - du graissage|n.|m.




 

