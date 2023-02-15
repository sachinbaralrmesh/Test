namespace my.db;
using { cuid } from '@sap/cds/common';

type Status : String enum {
  finished; accepted; draft; discontinued;
}
entity Topics {
  key ID : UUID;
  name  : String;
  status : Status;
  aquicition: Boolean;
  topicstags: Composition of many TopicsTags on topicstags.topics = $self;
  topicsRegions: Composition of many TopicsRegions on topicsRegions.topics= $self;
  topicPublished: Composition of many Published on topicPublished.topics= $self;
}


entity Tags{
key ID :UUID;
name: String;
}


entity Regions{
key ID :UUID;
name: String;
}

entity Published: cuid{ 
 paylod: String(5000);
 topics: Association to Topics;
}
/*
payload={ 
  "name":"xyz",
  "tags":[{"TAG_ID"="234"},{"TAG_ID"="234"}]
}
*/

entity TopicsTags:cuid{
  topics: Association to Topics;
  tags:Association to Tags;
}

entity TopicsRegions:cuid{
  topics: Association to Topics;
  regions:Association to Regions;
}
