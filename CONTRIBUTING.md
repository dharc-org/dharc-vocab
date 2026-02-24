# Contributing to /DH.arc Vocabularies 🤝🏻

In this document you'll find guidelines for contributing to the /DH.arc Vocabularies repository. The primary type of contributions this document covers are as follows:
- preparing and/or adding new semantic artefacts to the repository 
    - converting ontologies formatted in OWL to SKOS for inclusion in the repository
- updating existing semantic artefacts  
- updating the repository's core files (e.g. to add new content, pages etc)


In addition this document covers how to install a local version of the repository on your machine which can be used for any of the above contributions. 

As of 2026 this repository is overseen and maintained by: 
- Laurent Fintoni (laurent.fintoni2@unibo.it), primary point of contact for preparation and creation of vocabularies, ontology conversion, and interface updates as well as troubleshooting for local installations 
- Tommaso Vitale (tommaso.vitale@unibo.it), primary point of contact for updates and additions to the live site

## Preparing a new semantic artefact for inclusion ✍🏻

The repository runs on [Skosmos](https://skosmos.org/), a web based open-source ontology browser developed and released by the team at the National Library of Finland, which uses SKOS as the underlying data model.

As such any semantic artefact intended for inclusion in the repository must be formatted in [SKOS](https://www.w3.org/TR/skos-reference/). The easiest, and likely common, example is that of a controlled vocabulary. 

Skosmos does support the use of non-SKOS properties from common ontologies and data models such as Dublin Core, DCAT, PROV-O, OWL, and FOAF. If your artefact includes properties from specific models/ontologies outside of SKOS the simplest way to display them is to provide an rdfs:label for it. Please see the [Skosmos documentation](https://github.com/NatLibFi/Skosmos/wiki/Data-Model) on Data Model for further details of such inclusions.  

All semantic artefacts intended for inclusion should be written in the [Turtle RDF syntax](https://www.w3.org/TR/turtle/) (file type .ttl). Direct links to external files written in RDF and OWL (for reference) can be included by use of the DCAT download property within the SKOS conceptScheme class. See the converted [Historical Context Ontology](https://lab.dharc.unibo.it/skosmos/hico/en/) for reference.  

All artefacts should ideally be made available in both English and Italian, as these are the official languages of the repository. This means that the artefact should include translations of string objects in each language for all classes and, where applicable, properties. It is possible to add an artefact in only one language, however this will make its contents inaccesible to users browsing in the unavailable language. If that is the case it is recommended to include a translation of the artefact's metadata in the Skosmos config file (see next section) in the unavailable language so that a user may at least see that the artefact is available in the other language as well as view basic details about it.  

To help you prepare the artefact and ensure its compatibility you can use the following resources: 
- [Skosify](https://github.com/NatLibFi/Skosify), a Python library built by the same team behind Skosmos which takes OWL, RDFS, and SKOS vocabularies as input and automatically cleans them up and aligns them to best practices. 
- [SKOS Play](https://skos-play.sparna.fr/play/), a browser-based set of tools for creating SKOS files (including from spreadsheets), as well as validate them. 
- [BARTOC Knowledge Organization Systems report](https://gbv.github.io/bartoc-vocabulary-software/), a regularly updated report that details existing software for the creation of KOS, useful if you are looking for a specific tool with which to create semantic artefacts. 

Our recommended process for preparing your semantic artefact for inclusion into the repository is as follows (this process also applies to artefacts sent directly to /DH.arc for inclusion where the author(s) are not able to prepare it beforehand):</br>  

1️⃣ Prepare and/or update the artefact</br>  
➡️ 2️⃣ Validate (see above for validation tools)</br>  
➡️ 3️⃣ Any errors? If yes go back to step 1, if no go to step 4</br>  
➡️ 4️⃣ The artefact is ready to be added to the repository</br>  
✅ 

You can refer to the [KNOT Taxonomy](https://raw.githubusercontent.com/icdp-digital-library/KNOT/refs/heads/main/data_model/controlled_vocabularies/1.5/ktx.ttl) as a SKOS-formatted controlled vocabulary that displays and interacts correctly within Skosmos. 

## Adding a new semantic artefact to the repository ✅

Adding a new semantic artefact can be done directly to the live site, which requires Tommaso Vitale to make the necessary changes, or via a local version first to ensure that everything looks and behave as intended, in which case Tommaso is only needed to run a quick set of update commands once ready (see below for further details).

In both cases what is required is as follows: 
- A validated SKOS-formatted semantic artefact (see previous section)
    - An existing host for the semantic artefact (optional but ideal), e.g. GitHub or a private server
- An update to the Skosmos config file that describes the artefact, required for the artefact to correctly display in the repository 
- An update to the .sh loading file, required to pull the artefact into the repository's graph 

Once all of this is ready, an update to the site is required from Tommaso which makes all the above live. 

### Hosting of the artefact (and subsequent updates)

Hosting of the semantic artefact can be done either via DH.arc or via your own preferred/existing system. The most common situation is that your artefact already exists elsewhere and is accessible via a direct URL, for example within a GitHub repository (in which case the direct access URL begins with raw.githubusercontent.com). In this case the repository simply calls the existing artefact (as well as grabbing a copy for redundancy) to populate the graph, meaning that updates to the original file will be reflected automatically. The only thing that will not update automatically is the separate description of the artifact loaded into the Skosmos config file or an update to the artefact's hosting location.   

If you would like to have the artefact hosted by DH.arc please contact Laurent Fintoni. 

Currently, OWL ontologies converted to SKOS are hosted by DH.arc by default while all other artefacts in the repository are hosted elsewhere by default. 

### Updating the Skosmos config file

To ensure that the new artefact displays correctly on the repository an update to config-docker-compose.ttl is required. This file contains the main configurations for the Skosmos implementation that DH.arc Vocabularies runs on. For more details on what is, and can be included in this file, see [the relevant official documentation page](https://github.com/NatLibFi/Skosmos/wiki/Configuration). 

For each new artefact added to the repository a new instance of the class skosmos:Vocabulary must be created. The default example provided by Skosmos for the STW thesaurus is as follows: 

<code>:stw a skosmos:Vocabulary, void:Dataset ;</br>
    dc:title "STW Thesaurus for Economics"@en ;</br>
    skosmos:shortName "STW";</br>
    dc:subject :cat_general ;</br>
    void:uriSpace "http://zbw.eu/stw/";</br>
    skosmos:language "en", "de";</br>
    skosmos:defaultLanguage "de";</br>
    void:sparqlEndpoint <http://fuseki-cache:80/skosmos/sparql> ;</br>
    skosmos:sparqlGraph <http://zbw.eu/stw/> .</br>
</code>

IMPORTANT: the subject of this new instance should match the prefix of the SKOS concept scheme in the artefact. In the above example :stw is the prefix used by the STW Thesaurus for Economics in their .ttl file. In addition the subject should be a prefix rather than a URI otherwise the generated URLs for the vocabularies will use the entire URI which makes them less legible. 

There are some important properties within this instance that you should ensure are correctly set:</br>
<code>skosmos:language;</code> ⚠️ This should always be set to have "en" and "it" as values which are the default languages of the repository</br>
<code>void:sparqlEndpoint <http://fuseki-cache:80/skosmos/sparql> ;</code> ⚠️ This should always be set to this URL</br>
<code>void:dataDump DIRECT LINK TO THE SOURCE FILE ;</code> ⚠️ This generates a download link for the artefact</br>
<code>skosmos:sparqlGraph DIRECT LINK TO THE SOURCE FILE ;</code>⚠️ This pulls the source file into the graph</br>

Do not forget that all URLs in Turtle must be wrapped in <>. 

In addition to the default properties required for this instantiation the following property should be added for internal styling:</br>
<code>skosmos:propertyLabelOverride [skosmos:property <http://www.w3.org/2004/02/skos/core#altLabel>; rdfs:label "Alternative Terms"@en];</code>

For further details of which properties are available see the above linked documentation or take a look at the live config file in the GitHub to see examples of how each existing artefact is instantiated on the repository. The primary points of consideration are as follows: 
- Which category should be used? 
    - By default new artefacts should be added to project specific category, especially when there are multiple artefacts relating to the same project. Converted OWL ontologies should be added to the ontologies category. A separate, non-project specific category for KOS does not currently exist but could be created. Tthe process for creating new categories under which to display the artefact is similar to instantiating a new artefact, however categories are instances of skos:Concept. See the existing config file for examples of how to format new categories.
- Display options such as showing a full alphabetical index, top concepts, and which mode should be the default on access. 

Again here the existing Skosmos documentation as well as the existing config file should provide the necessary references to cover most situations. Issues may arise for artefacts with a large amount of concepts or which use a collection-based organisation. For the latter, see the existing [WRITE Thesaurus](https://lab.dharc.unibo.it/skosmos/wt/en/) which was created and formatted with its inclusion into the repository in mind and therefore offers the best example of how to approach the formatting of a collection-based KOS. 

### Updating the load file 

Lastly, the load script file needs to be updated with the necessary command to add the new artefact to the repository and call the relevant source file. 

This load file is contained within the /vocab_files folder which is where the repository stores local copies of each artefact as a redundancy. Every time changes are made to the repository, the loading script file must be run in order to reload all vocabularies. As noted above, changes made to externally loaded files should automatically show on the repository as long as these changes do not involve changes in file names or location. 

The formatting for the command to add is as follows:</br>
<code>curl -L -o ktx.ttl https://raw.githubusercontent.com/icdp-digital-library/KNOT/refs/heads/main/data_model/controlled_vocabularies/1.5/ktx.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@ktx.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/icdp-digital-library/KNOT/refs/heads/main/data_model/controlled_vocabularies/1.5/ktx.ttl"</code>

Where: 
- the .ttl file is the name of the file being called 
- the first URL is a direct link to the source file 
- the second URL is the same but combined with the preceding localhost address (http://localhost:9030/skosmos/data?graph=)

When adding a new artefact do the following:
- Add a comment to the .sh file stating which artefact is being loaded (using the same title used in the config file)
- Add the command for it below 
- Save the .sh file 

## Installing a local instance of Skosmos (for testing or core file updates) 🖥️

A local instance of the /DH.arc Vocabularies repository can be installed on your machine in order to test the artefacts you wish to add or make updates to Skosmos' core files such as the CSS, php files, or twig templates. For more information on the [Skosmos architecture](https://github.com/NatLibFi/Skosmos/wiki/Backend-architecture) please see their documentation. Currently the /DH.arc Vocabularies repository runs Skosmos 2.18.1 and has been lightly modified with changes to the CSS and twig templates primarily. Updates to the core files should be managed with Laurent Fintoni. 

In order to run a local instance of the repository to test your own artefacts you need the Docker desktop application and a local copy of the GitHub repository. Please first request access to the repository from Tomasso Vitale, who can add you as a collaborator. 

Below is an example workflow for a MacOS machine running on an M1 chip, please note that machine specifications will likely require some alteration to the workflow and/or docker files. It is also recommended to do this using a code editor of your choice, such as VS Code, which can handle the necessary changes in source control, so that once your tests are complete you can push the necessary updates directly to the live repository at which point a final update to the live site is required by Tomasso Vitale as explained in section TK. 

⚠️IMPORTANT:⚠️
- If you encounter errors running docker compose it may be required to update the docker-compose.yml file. In the past, running docker compose on an M1 machine required the addition of the platform specification, which is no longer required. 
- The docker-compose.yml and the config-docker-compose.ttl files each require a change to run locally compared to the live version. These changes are due to the fact that the live site requires reverse proxy settings to function correctly. As such docker-compose.yml contains two lines in the ports section for the skosmos image: ${SKOSMOS_PORT:-9090}:80, used for the local version, and 8083:80, used for the live version. Meanwhile, config-docker-compose.ttl includes the following triple in the config instance (located at the end): skosmos:baseHref "https://lab.dharc.unibo.it/skosmos/". This triple is required for reverse proxy on the live site but should be disabled for local versions. 
    - This means that your local versions of both files will need to comment the live requirements out and uncomment local requirements. For docker-compose.yml this means switching the comment # from one port to the other, while for config-docker-compose.ttl this means commenting the aforementioned triple out and closing the config instance at the previous triple. 
    - Once you are ready to push your changes back to the repository you must ensure that you revert these changes so that the file on the repository has the correct settings. So docker-compose.yml should have the 8083:80 port uncommented and the config-docker-compose.ttl file should have the baseHref triple uncommented. 

1️⃣ From within the local version of the GitHub repository, open a terminal and run the "docker compose up -d" command. This requires the Docker desktop application, which will open (if not already opened) and build the necessary images and containers for the application to run locally. ⚠️ Rememeber to update the config files for ports and reverse proxy as detailed in the note above. It is recommended to run the local docker implementation using compose as this will do so using three images and containers (one for the app, one for Fuseki, and one for the Varnish HTTP cache). Please the [Skosmos documentation](https://github.com/NatLibFi/Skosmos/tree/main/dockerfiles) for more details. Your local version of the repository should now be available at localhost:9090 (or equivalent). In order to load this local version with the existing artefacts you should open a terminal in the vocab_files folder and run the loading script, which will add all existing artefacts to the triple store. 

2️⃣ Using your editor of choice make the necessary updates to the Skosmos config file to add the new artefact to the repository, and the necessary updates to the loading script, as detailed in the previous section. Once these changes are done you should run the new loading command for the new artefact (from the vocab_files folder) and refresh the website to see your artefact and to be able to navigate its contents. 

3️⃣ Once everything is working as intended you can commit your changes to the GitHub repository. At this point a final update is required by Tomasso Vitale to make these changes live on the repository itself. 

## Converting OWl-formatted ontologies to SKOS

Coming soon. In the meantime if you have any questions please contact Laurent Fintoni. 

## A note about repository structure 

Coming soon. 
