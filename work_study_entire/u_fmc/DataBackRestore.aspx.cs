using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Diagnostics;

public partial class DataBackRestore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //string SqlStr1 = "Server=LIWEIWIN;DataBase=DBshutter2;Uid=sa;Pwd=123456";
            //string SqlStr2 = "Exec sp_helpdb";
            //SqlConnection con = new SqlConnection(SqlStr1);
            //con.Open();
            //SqlCommand com = new SqlCommand(SqlStr2, con);
            //SqlDataReader dr = com.ExecuteReader();
            this.DropDownList1.DataSource =DBManager.Query("Exec sp_helpdb");
            this.DropDownList1.DataTextField = "name";
            this.DropDownList1.DataBind();
            //dr.Close();
            //con.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string SqlStr1 = "Server=LIWEIWIN;database='" + this.DropDownList1.SelectedValue + "';Uid=sa;Pwd=123456";
        string SqlStr2 = "backup database " + this.DropDownList1.SelectedValue + " to disk='" + this.TextBox1.Text.Trim() + ".bak'";
        SqlConnection con = new SqlConnection(SqlStr1);
        con.Open();
        try
        {
            if (File.Exists(this.TextBox1.Text.Trim()))
            {
                Response.Write("<script language=javascript>alert('此文件已存在，请从新输入！');location='Default.aspx'</script>");
                return;
            }
            SqlCommand com = new SqlCommand(SqlStr2, con);
            com.ExecuteNonQuery();
            Response.Write("<script language=javascript>alert('备份数据成功！');location='shujuku.aspx'</script>");
        }
        catch (Exception error)
        {
            Response.Write(error.Message);
            Response.Write("<script language=javascript>alert('备份数据失败！')</script>");
        }
        finally
        {
            con.Close();
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string path = this.FileUpload1.PostedFile.FileName; //获得备份路径及数据库名称
        string dbname = this.DropDownList1.SelectedValue;
        string SqlStr1 = "Server=LIWEIWIN;database='" + this.DropDownList1.SelectedValue + "';Uid=sa;Pwd=123456";
        string SqlStr2 = "use ceshigz restore database " + dbname + " from disk='" + path + "'";
        SqlConnection con = new SqlConnection(SqlStr1);
        con.Open();
        try
        {
            SqlCommand com = new SqlCommand(SqlStr2, con);
            com.ExecuteNonQuery();
            Response.Write("<script language=javascript>alert('还原数据成功！');location='shujuku.aspx'</script>");
        }
        catch (Exception error)
        {
            Response.Write(error.Message);
            Response.Write("<script language=javascript>alert('还原数据失败！')</script>");
        }
        finally
        {
            con.Close();
        }
    }
} 
