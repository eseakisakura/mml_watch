using System;
using System.Diagnostics;

public class Wrapper
{
	//�t�B�[���h,�ϐ�
	// public string Str;
	//���\�b�h,�֐�
	public void Open_ps()
	{
		//Process�I�u�W�F�N�g�𐶐�
		var dp= new ProcessStartInfo();

		//Process�w��
		dp.FileName= "powershell.exe";

		//�V�F���@�\
		dp.UseShellExecute= false; // �R�����g�A�E�g�Ńf�o�b�O

		//�R���\�[���E�E�B���h�E���J���Ȃ�
		dp.CreateNoWindow= true; // �R�����g�A�E�g�Ńf�o�b�O

		// -NoExit �Ńf�o�b�N // @ ha \ no tame
		string ph= @" -ExecutionPolicy RemoteSigned -Sta -File .\script\mml_watch.ps1";
		// option
		dp.Arguments= ph;

		//�N��
		var p= Process.Start(dp);


		p.WaitForExit();
		p.Close();
	}
}

class Program
{
	//�G���g���|�C���g
	static void Main()
	{
	     try
	    {
			//�C���X�^���X��
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
