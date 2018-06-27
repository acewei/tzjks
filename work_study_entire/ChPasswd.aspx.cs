using System;
using System.Web.UI;
using System.Security.Cryptography;
using System.Text;

public partial class ChPasswd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string strSql = "select * from [User] where UserName='" + TextBox1.Text + "' and password='" + GetStrMd5(TextBox2.Text) + "'";
        if(Page.IsValid)
        if (DBManager.Query(strSql).Tables[0].Rows.Count != 0)
            if (DBManager.Nonquery("update [user] set password='" + GetStrMd5(TextBox3.Text) + "' where username='" + TextBox1.Text + "'") > 0)
            {
                Timer1.Enabled = true;
                tip.Text = "修改成功";
            }
            else
            {
                Timer1.Enabled = true;
                tip.Text = "修改失败";
            }
        else
        {
            Timer1.Enabled = true;
            tip.Text = "密码不正确";
        }
    }

    public static string GetStrMd5(string ConvertString)
    {
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        string t2 = BitConverter.ToString(md5.ComputeHash(UTF8Encoding.Default.GetBytes(ConvertString)));
        t2 = t2.Replace("-", "");
        return t2.ToLower();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        tip.Text = String.Empty;
        Timer1.Enabled = false;
    }
}