/**
 * Created by stan on 2016-03-03.
 */
public class Result {
    String document_id ;
    int document_rank ;
    double score ;

    public Result(String docid, Integer rank_pos, String score_value){
        document_id=docid;
        document_rank=rank_pos;
        score=Double.parseDouble(score_value);
    }
// Add the constructors .
// Create getDocumentId and seDocumentId functions .
// Create getDocumentScore and seDocumentScore functions
// Create getDocumentRank and seDocumentRank functi
}
