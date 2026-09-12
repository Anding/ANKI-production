## ANKI vocabulary
This documents a pipeline for importing vocab to ANKI
 - The prompt will specify a requested a list of French / English vocabulary
 - Please prepare an ANKI import file of the requested vocabulary in this format
 
### File specification
 - The filename must be `vocab.txt`
 - Encoding must be UTF-8

### Content specification
 - Each item of vocabulary should be on a separate line 
 - Do not include any headings
 - Do not leave any blank lines  
 - Each vocabulary item is laid out in fields
 - Field should be separated by `|` (pipe character)  
 - Do not include any notes or comments after the fields  
 - Please check for and elimiate duplicates
 - All English and French words should be lower case except proper nouns 
 - Multi‑word expressions are allowed. Treat them as vocabulary items and follow the same field rules
 
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
Examples:
 - je regarde, nous regardons, regarder, regardé
 - je suis, nous sommes, être, été
For reflexive verbs, include the reflexive pronoun in the French forms. Example:
 - je me lève, nous nous levons, se lever, levé
 Use the natural spoken forms for the 1st‑person singular and plural. Example:
 - je mange, nous mangeons
 
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
     
5. For uncountable nouns, include the natural grammatical gender
   - du lait|n.|m.

6. For nouns that exist only in the plural, use the plural form with the correct article
   - des ciseaux|n.|m. pl.
   
7. Use elided forms where they are natural in spoken French
    - de l’eau
    - de l’essence

 ### Language guidance
 - I am learning to communicate with spoken and simple written French
 - I am not not studying for a written exam
 - My common usage situations include
    - with tradesmen, contractors, designers and architects about the renovation my manor house
    - with landscapers, tree surgeons, drainage engineers, handymen and other outdoor professional about the maintenance and development of my grounds
    - at the local motoculture shop about buying and using outdoor machinery for my grounds (e.g. chainsaw, tractor, mower, quad bike, wood chipper)
    - at the local garage about the repair and maintenance of my cars, trailers and motorcross bikes
    - at the mayor's office and the post office dealing with local administration
    - with local people, breifly passing the time of day in customary French
    - with the local farmers about their agricultural activities on the land which they lease from me
    - dealing with the staff at French activity attractions for children (e.g. kayaking, tree climbing)   
    - in the supermarket for daily shopping, where it is helpful to be able to read labels on food  
    - understanding e-mails from utility companies and occasionally phone calls to resolve issues
    - speaking to roadside assistance in the event of a vehicle breakdown
 - My usage situations exclude
    - social occasions
    - family and school events
    - restaurants and hotels
    - personal relationships
    - general tourism

 

