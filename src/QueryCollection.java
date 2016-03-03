/**
 * Created by stan on 2016-03-03.
 */
import java.util.HashMap;
import java.util.ArrayList;

public class QueryCollection {
    public HashMap<String, ArrayList<Result>> queries = new HashMap();
    public void addResult(String key, Result result){
        if (queries.containsKey(key)) {
            queries.get(key).add(result);
        }
        else{
            ArrayList<Result> newList = new ArrayList<Result>();
            newList.add(result);
            queries.put(key,newList);
        }
    }
    public int determineRank(String key){
        return queries.get(key).size();
    }
}
