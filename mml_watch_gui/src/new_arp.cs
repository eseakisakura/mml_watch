using System; 
using System.Diagnostics;

class Program
{
  public static void Main(string[] args)
  {
	string argss= System.IO.Path.Combine(args);
	string abs= " -ExecutionPolicy RemoteSigned -Sta -File .\\script\\common.ps1 arp_gene";
	string arg= " '"+ argss+  "'";
	abs+= arg;

	ProcessStartInfo dp= new ProcessStartInfo();

	dp.FileName= "powershell.exe";

	dp.UseShellExecute= false;
	dp.CreateNoWindow= true;

	dp.Arguments= abs;

	Process p= Process.Start(dp);
	p.WaitForExit();
	p.Close();
  }
}
 
