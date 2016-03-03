import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by stan on 2016-03-03.
 */
public class ExtractionEvaluation {


    public static void main(String[] args) {
        String absolutePathToRetreivalFile="";
        String absolutePathToQrelsFile="";
        String absolutePathToCollectionSpecFile="";
        String line;

        QueryCollection qc = new QueryCollection();
        try {
            FileReader fileReader = new FileReader(absolutePathToRetreivalFile);
            BufferedReader records = new BufferedReader(fileReader);

            while((line = records.readLine()) != null) {
                String[] fields = line.split(" ");
                String query = fields[0];
                Integer rank = qc.determineRank(query);
                String docid = fields[2];
                String score = fields[3];
                Result result = new Result(docid, rank, score);
                qc.addResult(query,result);
            }
            records.close();
        }
        catch(FileNotFoundException ex) {
            System.out.println("Unable to open file '" + absolutePathToRetreivalFile + "'");
        }
        catch(IOException ex) {
            System.out.println("Error reading file '"+ absolutePathToRetreivalFile + "'");
        }

        //----------

        try {
            FileReader fileReader = new FileReader(absolutePathToQrelsFile);
            BufferedReader records = new BufferedReader(fileReader);

            while((line = records.readLine()) != null) {
                String[] fields = line.split(" ");
                String query = fields[0];
                Integer rank = qc.determineRank(query);
                String docid = fields[2];
                String score = fields[3];
                Result result = new Result(docid, rank, score);
                qc.addResult(query,result);
            }
            records.close();

        }
        catch(FileNotFoundException ex) {
            System.out.println("Unable to open file '" + absolutePathToQrelsFile + "'");
        }
        catch(IOException ex) {
            System.out.println("Error reading file '"+ absolutePathToQrelsFile + "'");
        }


    }
}
