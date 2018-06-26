using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

/// <summary>
/// DBManager 的摘要说明
/// </summary>
public class DBManager
{
    static string sqlstr = ConfigurationManager.ConnectionStrings["WSConnectionString"].ConnectionString;
    public DBManager()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //

    }

    public static DataSet Query(string sql)
    {
        using (SqlConnection sqlcon=new SqlConnection(sqlstr))
        {
            DataSet ds = new DataSet();
            try
            {
                sqlcon.Open();
                SqlDataAdapter sa = new SqlDataAdapter(sql,sqlcon);
                sa.Fill(ds);
            }catch(Exception e)
            {
                throw new Exception(e.ToString());
            }
            return ds;
        }
           
    }

    public static int Nonquery(string sql)
    {
        using (SqlConnection sqlcon = new SqlConnection(sqlstr))
        {
            DataSet ds = new DataSet();
            SqlCommand sqlcom = new SqlCommand(sql,sqlcon);
            int infrow = 0;
            try
            {
                sqlcon.Open();
                infrow=sqlcom.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception(e.ToString());
            }
            return infrow;
        }
    }
}