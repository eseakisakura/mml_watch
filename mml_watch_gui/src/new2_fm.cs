using System; 
using System.Diagnostics;

class Program
{
  public static void Main(string[] args)
  {
	string abs= " -ExecutionPolicy RemoteSigned -Sta -File .\\script\\common.ps1 fm_editor";

	// if(args.Length > 0){

	// 	string mml= " "+ "\""+ args[0]+ "\"";
	// 	abs+= mml;
	// }
	
	// Console.WriteLine(abs);

	ProcessStartInfo dp= new ProcessStartInfo();

	dp.FileName= "powershell.exe";

	dp.UseShellExecute= false;	// シェル窓を開くか
	dp.CreateNoWindow= true;	// call appの窓を開かない

	dp.Arguments= abs;

	Process p= Process.Start(dp);
	// Console.ReadKey();
	p.WaitForExit();
	p.Close();
  }
}
