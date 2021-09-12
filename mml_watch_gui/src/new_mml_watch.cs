using System; 
using System.Diagnostics;

class Program
{
  public static void Main(string[] args)
  {
	string absPath = System.IO.Path.Combine(args);

	ProcessStartInfo dp= new ProcessStartInfo();

	dp.FileName= "powershell.exe";

	dp.UseShellExecute= false;
	dp.CreateNoWindow= true;

	dp.Arguments= " -ExecutionPolicy RemoteSigned -Sta -File .\\script\\common.ps1 mml_watch "+ args;

	Process p= Process.Start(dp);
	p.WaitForExit();
	p.Close();
  }
}
 
