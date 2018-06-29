using System;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    string userid;
    RadioButtonList rbl = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        //turn to
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        rbl = (RadioButtonList)Login1.FindControl("RadioButtonList1");
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConfigurationManager.ConnectionStrings["WSConnectionString"].ConnectionString);
        con.Open();
        if (rbl.SelectedIndex==-1) Page.ClientScript.RegisterClientScriptBlock(GetType(), "Aad", "alert('请选择用户类型')", true);
        else
        {
            string strSql = "select * from [User] where UserName='" + Login1.UserName.ToString() + "' and password='" + GetStrMd5(Login1.Password.ToString()) + "' and userid='" + rbl.SelectedItem.Value + "'";
            System.Data.SqlClient.SqlCommand com = new System.Data.SqlClient.SqlCommand(strSql, con);
            System.Data.SqlClient.SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                Session["username"] = dr.GetString(0);//Login1.UserName.ToString();
                Session["userid"] = dr.GetString(2);
                Session["remark"] = dr.GetString(3);
                e.Authenticated = true;//通过验证 
                if (Session["userid"].ToString() == "学生") Response.Redirect("~/u_student/Apply.aspx");
                if (Session["userid"].ToString() == "用人单位") Response.Redirect("~/u_employer/ApplyReview.aspx");
                if (Session["userid"].ToString() == "学工组") Response.Redirect("~/u_stuwg/StudentInfoMgr2.aspx");
                if (Session["userid"].ToString() == "资助中心") Response.Redirect("~/u_fmc/WorkInfoMaintain.aspx");


            }
            else
            {
                e.Authenticated = false;
            }
            dr.Close();
            con.Close();
        }
    }

    public static string GetStrMd5(string ConvertString)
    {
        MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
        string t2 = BitConverter.ToString(md5.ComputeHash(UTF8Encoding.Default.GetBytes(ConvertString)));
        t2 = t2.Replace("-", "");
        return t2.ToLower();
        
    }


}

