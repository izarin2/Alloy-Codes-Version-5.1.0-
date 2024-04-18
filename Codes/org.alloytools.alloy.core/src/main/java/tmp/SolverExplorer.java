package tmp;
import java.lang.reflect.Field;
import java.util.Arrays;
import edu.mit.csail.sdg.alloy4.A4Reporter;
import edu.mit.csail.sdg.alloy4.Err;
import edu.mit.csail.sdg.ast.Command;
import edu.mit.csail.sdg.ast.Module;
import edu.mit.csail.sdg.parser.CompUtil;
import edu.mit.csail.sdg.translator.A4Options;
import edu.mit.csail.sdg.translator.A4Solution;
import edu.mit.csail.sdg.translator.TranslateAlloyToKodkod;

import static edu.mit.csail.sdg.alloy4.A4Reporter.NOP;

public class SolverExplorer {


    public static void addLibraryPath(String pathToAdd) throws Exception {
        Field usrPathsField = ClassLoader.class.getDeclaredField("usr_paths");
        usrPathsField.setAccessible(true);
        String[] paths = (String[]) ((String[]) usrPathsField.get((Object) null));
        String[] newPaths = paths;
        int var4 = paths.length;

        for (int var5 = 0; var5 < var4; ++var5) {
            String path = newPaths[var5];
            if (path.equals(pathToAdd)) {
                return;
            }
        }

        newPaths = (String[]) Arrays.copyOf(paths, paths.length + 1);
        newPaths[newPaths.length - 1] = pathToAdd;
        usrPathsField.set((Object) null, newPaths);
    }


    public static void main(String[] args) throws Exception {
        //Paths path=new Paths();
        if (args.length < 1) {
            System.out.println("Parameter wrong");
        } else {
            String libraryPath = args[1];

//
            try {
                addLibraryPath(libraryPath);
            } catch (Exception var41) {
                //var41.printStackTrace();
            }

            A4Reporter rep = new A4Reporter();
            String input_file = args[0];
            System.out.println(input_file);
            A4Options options = new A4Options();
            options.solver = A4Options.SatSolver.SAT4J;
            Module world = CompUtil.parseEverything_fromFile(rep, null, String.valueOf(input_file));
            A4Solution ans = null;
            options.skolemDepth = 1;
            options.symmetry=20;
            long total_time = 0;
            long total_memory = 0;

            for (Command command : world.getAllCommands()) {

                try {
                    ans = TranslateAlloyToKodkod.execute_command(NOP, world.getAllReachableSigs(), command, options);
                    System.out.println(ans);
                    long startTime = System.nanoTime();
                   long endTime = System.nanoTime();

                    long current_execution_time;

                    // Calculate the execution time in milliseconds
                    long executionTime = (endTime - startTime);
                    long used_memory = 0;
                    int MegaBytes = 10241024;
                    long freeMemory = Runtime.getRuntime().freeMemory() / MegaBytes;
                    long totalMemory = Runtime.getRuntime().totalMemory() / MegaBytes;
                    long maxMemory = Runtime.getRuntime().maxMemory() / MegaBytes;

                    current_execution_time = executionTime;

                    //System.out.println("Counting takes "
                    //         + executionTime + " nano sec");
                    total_time = total_time + current_execution_time;
                    //total_memory = total_memory + used_memory;

                    freeMemory = Runtime.getRuntime().freeMemory() / MegaBytes;
                   // totalMemory = Runtime.getRuntime().totalMemory() / MegaBytes;
                    //maxMemory = Runtime.getRuntime().maxMemory() / MegaBytes;
                   // used_memory = maxMemory - freeMemory;
                    //total_memory = total_memory + used_memory;

                    // System.out.println("Used Memory : " + used_memory + "MB ");


                } catch (Err ex) {
                    System.out.println(ex);
//                Logger.getLogger(AlloyTest.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
            System.out.println("Total Time " + total_time + " nano sec");



        }

    }

}



