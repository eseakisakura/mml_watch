using System;
using System.Diagnostics;

public class Wrapper
{
	//フィールド,変数
	// public string Str;
	//メソッド,関数
	public void Open_ps()
	{
		//Processオブジェクトを生成
		var dp= new ProcessStartInfo();

		//Process指定
		dp.FileName= "powershell.exe";

		//シェル機能
		dp.UseShellExecute= false; // コメントアウトでデバッグ

		//コンソール・ウィンドウを開かない
		dp.CreateNoWindow= true; // コメントアウトでデバッグ

		// -NoExit でデバック // @ ha \ no tame
		string ph= @" -ExecutionPolicy RemoteSigned -Sta -File .\script\mml_watch.ps1";
		// option
		dp.Arguments= ph;

		//起動
		var p= Process.Start(dp);


		p.WaitForExit();
		p.Close();
	}
}

class Program
{
	//エントリポイント
	static void Main()
	{
	     try
	    {
			//インスタンス化
			Wrapper psr= new Wrapper();

			// psr.Str= "";
			psr.Open_ps();
	    }
	    catch
	    {
	    }
	    finally
	    {
	    }
	}
}
