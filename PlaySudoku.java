/* Matthew Digman
Matthew Digman
plays a game of sudoku
if the puzzle isnt complete after rule 4, it is either entered incorrectly or impossible*/
import java.util.Scanner;
import java.io.*;
public class PlaySudoku{
	private static int backtracks;
	public static void main(String[] args) throws IOException{
		Sudoku puzzle= new Sudoku(args[0]);
		solve(puzzle);
		System.out.print(puzzle);
	}
	private static void solve(Sudoku puzzle){
		int numZeros=puzzle.countNumberOfZeros();
		int oldNumZeros=numZeros+1;
		while(numZeros<oldNumZeros){
			oldNumZeros=numZeros;
			puzzle.rule1();
			puzzle.rule2();
			puzzle.rule3();
			if(puzzle.countNumberOfZeros()==0)
				return;
			numZeros=puzzle.countNumberOfZeros();
		}
		//in case of emergency, break glass
		if(puzzle.countNumberOfZeros()!=0){
			backtracks=puzzle.breakGlass();
		}
	}
}
