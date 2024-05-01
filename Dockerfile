FROM solr

USER root

RUN apt-get update && apt-get install --no-install-recommends --yes hunspell-hu

COPY --chown=solr:solr ./var/solr/data/opensemanticsearch /tmp/data/opensemanticsearch

COPY --chown=solr:solr ./src/open-semantic-entity-search-api/src/solr/opensemanticsearch-entities /tmp/data/opensemanticsearch-entities

COPY etc /etc

# Recreate symbolic links for hunspell (required for windows compatibility)
RUN ln -sf /usr/share/hunspell /var/solr/data/opensemanticsearch/conf/lang/
RUN ln -sf /usr/share/hunspell /var/solr/data/opensemanticsearch-entities/conf/lang/

USER solr
