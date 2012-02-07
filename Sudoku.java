/*Matthew Digman
Matthew Digman
Manages the sudoku board and contains the rules*/
import java.util.*;
public class Sudoku{
	private int[][] matrix;
	private int backtracks;
	public Sudoku(String puzzle){
		matrix=new int[9][9];
		for(int x=0; x<9; x++)
			for(int y=0; y<9; y++)
				matrix[x][y]=Integer.parseInt(""+puzzle.charAt(x*9+y));
	}
	public String toString(){
		String str="\n";
		for(int x=0; x<9; x++){
			for(int y=0; y<9; y++){
				str += matrix[x][y]+" ";
			}
		}
		return str;
	}
	// fills in all blanks that admit a single possibility
	public void rule1(){
		boolean done=false;
		while(!done){
			done=true;
			for(int x=0; x<9; x++){
				for(int y=0; y<9; y++){
					if(matrix[x][y]==0){
						int value=findUniqueValueFor(x,y);
						if(value!=0){
							matrix[x][y]=value;
							done=false;
						}
					}
				}
			}
		}
	}

	// This method is project 12-9. It considers all numbers missing from a row and determines is there is only one place within said row that the number can go.
	public void rule2(){
		boolean done=false;
		while(!done){
			done=true;
			for(int y=0; y<9; y++){
				List<Integer> missingNum=new LinkedList<Integer>();
				for(int itr=1; itr<=9; itr++){
					boolean test=true;
					for(int x=0; x<9; x++){
						if(matrix[y][x]==itr){
							test=false;
							break;
						}
					}
					if(test)
						missingNum.add(itr);
					else
						test=true;
				}
				for(int testNum:missingNum){
					int loc=-1;
					for(int x=0; x<9; x++){
						if(probeIsOkay(testNum, y,x)){
							if(loc!=-1){
								loc=-1;
								break;
							}else{
								loc=x;
							}
						}
					}
					if(loc!=-1){
						matrix[y][loc]=testNum;
						done=false;
						loc=-1;
					}
				}
			}
		}
	}
	//This method is project 12-10. it considers all numbers missing from a row and determines if there is only one place within said row that number can go.
	public void rule3(){
		boolean done=false;
		while(!done){
			done=true;
			for(int y=0; y<9; y++){
				List<Integer> missingNum=new LinkedList<Integer>();
				for(int itr=1; itr<=9; itr++){
					boolean test=true;
					for(int x=0; x<9; x++){
						if(matrix[x][y]==itr){
							test=false;
							break;
						}
					}
					if(test)
						missingNum.add(itr);
					else
						test=true;
				}
				for(int testNum:missingNum){
					int loc=-1;
					for(int x=0; x<9; x++){
						if(probeIsOkay(testNum, x,y)){
							if(loc!=-1){
								loc=-1;
								break;
							}else{
								loc=x;
							}
						}
					}
					if(loc!=-1){
						matrix[loc][y]=testNum;
						done=false;
						loc=-1;
					}
				}
			}
		}
	}
	//though not required for any project, this recursive method uses a modified brute force strategy to solve a puzzle, no matter how long it takes.

	public int breakGlass(){
		int x=-1;
		int y=0;
		backtracks=0;
		rule4(x,y);
		return backtracks;
	}

	public boolean rule4(int x, int y){
		if(x>=8){
			x=0;
			y++;
		}else x++;
		if(matrix[x][y]!=0){
			if(!(x==8&&y==8)){
				if(rule4(x,y))
					return true;
				else return false;
			}else return true;
		}else{
			for(int itr=1; itr<=9; itr++){
				if(probeIsOkay(itr,x,y)){
					matrix[x][y]=itr;
					if(!(x==8&&y==8)){
						if(rule4(x,y)){
							return true;

						}else{
							matrix[x][y]=0;
						}
					}else return true;
				}
			}
			backtracks++;
			return false;
		}
	}

	//method that trys rules 1-3
	public void tryRules(){
		int numZeros=countNumberOfZeros();
		int oldNumZeros=numZeros+1;
		while(numZeros<oldNumZeros){
			oldNumZeros=numZeros;
			rule1();
			rule2();
			rule3();
			if(countNumberOfZeros()==0)
				return;
			numZeros=countNumberOfZeros();
		}
	}
	//for use in brute force strategy, determines if the program has done something impossible
	private boolean isContradiction(){
		for(int x=0; x<9; x++){
			for(int y=0; y<9; y++){
				if(matrix[x][y]==0){
					boolean hasPossibility=false;
					for(int itr=1; itr<=9; itr++){
						if(probeIsOkay(itr, x,y)){
							hasPossibility=true;
							break;
						}
					}
					if(!hasPossibility){
						System.out.print("Contradiction detected");
						return false;

					}else{
						hasPossibility=false;
					}
				}
			}
		}
		return true;
	}

	private int findUniqueValueFor(int x, int y){
		int value=0;
		for(int v=1; v<=9; v++){
			if(probeIsOkay(v,x,y)){
				if(value==0)
					value=v;
				else
					return 0;
			}
		}
		return value;
	}
	private boolean probeIsOkay(int probe, int x, int y){
		if(matrix[x][y]!=0)
			return false;
		for(int itr=0; itr<9; itr++)
			if(itr!=y){
				if(probe==matrix[x][itr])
					return false;
			}
		for(int itr=0; itr<9; itr++)
			if(itr!=x){
				if(probe==matrix[itr][y])
					return false;
			}
		int topLeftRow=x-x%3;
		int topLeftColumn=y-y%3;
		for(int ii=topLeftRow; ii<topLeftRow+3; ii++)
			for(int jj=topLeftColumn; jj<topLeftColumn+3; jj++)
				if(ii!=x||jj!=y){
					if (probe==matrix[ii][jj])
						return false;
				}
		return true;
	}
	public int countNumberOfZeros(){
		int count=0;
		for(int x=0; x<9; x++)
			for(int y=0; y<9; y++)
				if(matrix[x][y]==0)
					count++;
		return count;
	}
}

