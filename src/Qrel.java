/**
 * Created by stan on 2016-03-03.
 */
public class Qrel {
    String document_id ;
    int topic_no ;
    int subtopic_no ;
    int judgment ;
    public Qrel(String docid, int relevance){
        document_id=docid;
        judgment=relevance;
    }
}
