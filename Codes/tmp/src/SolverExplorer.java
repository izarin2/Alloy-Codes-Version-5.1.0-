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

    public static void main(String[] args) {
        if (args.length < 3) {
            System.out.println("Insufficient arguments provided.");
            return;
        }

        String libraryPath = args[2];

        try {
            addLibraryPath(libraryPath);
        } catch (Exception ex) {
            System.out.println("Error adding library path: " + ex.getMessage());
            return;
        }

        A4Reporter rep = new A4Reporter();
        String input_file = args[0];
        String solver_name = args[1];
        A4Options options = new A4Options();

        switch (solver_name) {
            case "Minisat":
                options.solver = A4Options.SatSolver.MiniSatJNI;
                break;
            case "Sat4j":
                options.solver = A4Options.SatSolver.SAT4J;
                break;
            case "Minisatprover":
                options.solver = A4Options.SatSolver.MiniSatProverJNI;
                break;
            default:
                System.out.println("Wrong Solver");
                return;
        }

        try {
            Module world = CompUtil.parseEverything_fromFile(rep, null, input_file);
            A4Solution ans = null;
            options.skolemDepth = 1;
            long total_time = 0;
            int count = 0;

            for (Command command : world.getAllCommands()) {
                try {
                    ans = TranslateAlloyToKodkod.execute_command(rep, world.getAllReachableSigs(), command, options);
                    long startTime = System.nanoTime();
                    long endTime = System.nanoTime();
                    long current_execution_time = endTime - startTime;
                    total_time += current_execution_time;
                } catch (Err ex) {
                    System.out.println("Error executing command: " + ex.getMessage());
                }
            }

            System.out.println(total_time + " " + solver_name);
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }
}
