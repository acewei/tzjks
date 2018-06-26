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

public partial class SysInit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string sConn = "Server=LIWEIWIN;DataBase=DBshutter2;Uid=sa;Pwd=123456";
        SqlConnection SqlConn = new SqlConnection(sConn);
        SqlConnection conn = null;
        SqlTransaction tran = null;
        try
        {
            conn = new SqlConnection(sConn);
            conn.Open();
            tran = conn.BeginTransaction();
            SqlCommand cmd = new SqlCommand(@"delete from work-study;
                                              delete from Apply;
                                              delete from Employer;
                                              delete from Salary;
                                              delete from Schedule;
                                              delete from SHInfo;
                                              delete from Student;
                                              delete from StuFreeTime;
                                              delete from Time;
                                              delete from WorkCheck;
                                              delete from WorkInfo;
                                              delete from WorkReqTime;
                                              delete from User where UserId <>'学生资助管理中心';");
            cmd.Connection = conn;
            cmd.Transaction = tran;
            cmd.ExecuteNonQuery();
            tran.Commit();
            Response.Write("<script language=javascript>alert('初始化完成！');</" + "script>");
        }
        catch(Exception exp)
        {
            Response.Write(exp.Message);
            if(tran!=null)
            {
                //出错则回滚
                tran.Rollback();
            }
        }
        finally
        {
            if(conn != null && conn.State != ConnectionState.Closed)
            {
                conn.Close();
            }
        }
    }
}