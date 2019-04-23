public class eightQueen {
    static final int Q = 8;
    public static int[][] array = new int[Q][Q];
    public static int map;

    public static void main(String[] args) {
        System.out.println(Q+"皇后问题");
        findQueen(0);
        System.out.println(Q+"皇后问题共有" + map + "种解法");
    }

    public static void findQueen(int i) {
        if (i > Q - 1) {
            map++;
            print();
            return;
        }
        for (int m = 0; m < Q; m++) {
            if (check(i, m)) {
                array[i][m] = 1;
                findQueen(i + 1);
                array[i][m] = 0;
            }
        }
    }

    public static boolean check(int k, int j) {
        for (int i = 0; i < Q; i++) {
            if (array[i][j] == 1) {
                return false;
            }
        }
        for (int i = k - 1, m = j - 1; i >= 0 && m >= 0; i--, m--) {
            if (array[i][m] == 1) {
                return false;
            }
        }
        for (int i = k - 1, m = j + 1; i >= 0 && m <= Q-1; i--, m++) {
            if (array[i][m] == 1) {
                return false;
            }
        }
        return true;
    }

    public static void print() {//打印结果
        System.out.print("方案" + map + ":" + "\n");
        for (int i = 0; i < Q; i++) {
            for (int m = 0; m < Q; m++) {
                if (array[i][m] == 1) {
                    //System.out.print("皇后"+(i+1)+"在第"+i+"行，第"+m+"列\t");
                    System.out.print("o ");
                }
                else {
                    System.out.print("+ ");
                }
            }
            System.out.println();
        }
        System.out.println();
    }

}
