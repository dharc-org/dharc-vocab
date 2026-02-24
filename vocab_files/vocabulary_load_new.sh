# load KNOT vocabs 

curl -L -o ktx.ttl https://raw.githubusercontent.com/icdp-digital-library/KNOT/refs/heads/main/data_model/controlled_vocabularies/1.5/ktx.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@ktx.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/icdp-digital-library/KNOT/refs/heads/main/data_model/controlled_vocabularies/1.5/ktx.ttl"

curl -L -o kth.ttl https://raw.githubusercontent.com/icdp-digital-library/KNOT/refs/heads/main/data_model/controlled_vocabularies/1.5/kth.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@kth.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/icdp-digital-library/KNOT/refs/heads/main/data_model/controlled_vocabularies/1.5/kth.ttl"

# load Aldo Moro vocabs 

curl -L -o mtv.ttl https://raw.githubusercontent.com/sbrzt/moro/refs/heads/main/voc/types.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@mtv.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/sbrzt/moro/refs/heads/main/voc/types.ttl"

curl -L -o mrv.ttl https://raw.githubusercontent.com/sbrzt/moro/refs/heads/main/voc/roles.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@mrv.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/sbrzt/moro/refs/heads/main/voc/roles.ttl"

curl -L -o msv.ttl https://raw.githubusercontent.com/sbrzt/moro/refs/heads/main/voc/subjects.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@msv.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/sbrzt/moro/refs/heads/main/voc/subjects.ttl"

#load WRITE vocabs 

curl -L -o writeThesaurus_v.1.0.ttl https://raw.githubusercontent.com/WenDAng-project/thesaurus/refs/heads/main/writeThesaurus_v.1.0.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@writeThesaurus_v.1.0.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/WenDAng-project/thesaurus/refs/heads/main/writeThesaurus_v.1.0.ttl"

curl -L -o write-skos.ttl https://raw.githubusercontent.com/laurentfintoni/dharc-skosmos/refs/heads/main/ontologies_skos/write-skos.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@write-skos.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/laurentfintoni/dharc-skosmos/refs/heads/main/ontologies_skos/write-skos.ttl"

# load ontologies

curl -L -o fentry_skos.ttl https://raw.githubusercontent.com/laurentfintoni/dharc-skosmos/refs/heads/main/ontologies_skos/fentry_skos.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@fentry_skos.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/laurentfintoni/dharc-skosmos/refs/heads/main/ontologies_skos/fentry_skos.ttl"

curl -L -o odi-skos.ttl https://raw.githubusercontent.com/laurentfintoni/dharc-skosmos/refs/heads/main/ontologies_skos/odi-skos.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@odi-skos.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/laurentfintoni/dharc-skosmos/refs/heads/main/ontologies_skos/odi-skos.ttl"

curl -L -o hico-skos.ttl https://raw.githubusercontent.com/laurentfintoni/dharc-skosmos/refs/heads/main/ontologies_skos/hico-skos.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@hico-skos.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/laurentfintoni/dharc-skosmos/refs/heads/main/ontologies_skos/hico-skos.ttl"

# load ATLAS vocabs

curl -L -o ETV.ttl https://raw.githubusercontent.com/dh-atlas/Edition-Types-Vocabulary/refs/heads/main/1.0/ETV.ttl
curl -X POST -H Content-Type:text/turtle --data-binary "@ETV.ttl" "http://localhost:9030/skosmos/data?graph=https://raw.githubusercontent.com/dh-atlas/Edition-Types-Vocabulary/refs/heads/main/1.0/ETV.ttl"