using System; 
using System.Diagnostics;

class Program
{
  public static void Main()
  {
	ProcessStartInfo dp= new ProcessStartInfo();

	dp.FileName= "powershell.exe";

	dp.UseShellExecute= false;
	dp.CreateNoWindow= true;

	dp.Arguments= " -ExecutionPolicy RemoteSigned -Sta -File .\\script\\common.ps1 fm_editor";

	Process p= Process.Start(dp);
	p.WaitForExit();
	p.Close();
  }
}
 
