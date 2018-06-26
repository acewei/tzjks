using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class UserData
{
    private string m_UserName;
    private string m_PassWord;
    private string m_UserId;
    private string m_Remark;

    public string UserName
    {
        get { return this.m_UserName; }
        set { this.m_UserName = value; }
    }
    public string PassWord
    {
        get { return this.m_PassWord; }
        set { this.m_PassWord = value; }
    }
    public string UserId
    {
        get { return this.m_UserId; }
        set { this.m_UserId = value; }
    }
    public string Remark
    {
        get { return this.m_Remark; }
        set { this.m_Remark = value; }
    }
}
public class User
{
    public bool Insert(UserData dataUser)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = " insert into [User] (UsernName,PassWord,UserId,Remark)  values (@UsernName,@PassWord,@UserId,@Remark) ";
            objDB.Command.CommandType = System.Data.CommandType.Text;
            objDB.Command.CommandText = strSql;
            objDB.Command.Parameters.AddWithValue("@UserName", dataUser.UserName);
            objDB.Command.Parameters.AddWithValue("@PassWord", dataUser.PassWord);
            objDB.Command.Parameters.AddWithValue("@UserId", dataUser.UserId);
            objDB.Command.Parameters.AddWithValue("@Remark", dataUser.Remark);
            iRel = objDB.Command.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            //iRel = -1;
            throw new Exception(ex.ToString());
        }
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        bRel = (iRel.Equals(1) ? true : false);
        return bRel;
    }
    public bool Modify(UserData dataUser)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = "update [User] set PassWord=@PassWord,UserId=@UserId,Remark=@Remark where UserName = @UserName";
            objDB.Command.CommandType = System.Data.CommandType.Text;
            objDB.Command.CommandText = strSql;
            objDB.Command.Parameters.AddWithValue("@PassWord", dataUser.PassWord);
            objDB.Command.Parameters.AddWithValue("@UserId", dataUser.UserId);
            objDB.Command.Parameters.AddWithValue("@Remark", dataUser.Remark);
            objDB.Command.Parameters.AddWithValue("@UserName", dataUser.UserName);
            iRel = objDB.Command.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            //iRel = -1;
            throw new Exception(ex.ToString());
        }
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        bRel = (iRel.Equals(1) ? true : false); return bRel;
    }

    public bool Delete(string UserName)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = "delete from [User] where UserName=" + UserName + "";
            objDB.Command.CommandType = System.Data.CommandType.Text;
            objDB.Command.CommandText = strSql;
            iRel = objDB.Command.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            //iRel = -1;
            throw new Exception(ex.ToString());
        }
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        bRel = (iRel.Equals(1) ? true : false);
        return bRel;
    }

    public UserData[] Select(string UserName)
    {
        //int iRel = -1;
        CommonDB objDB = new CommonDB();
        UserData[] dataUser = new UserData[1];
        string sql = "select * from [User] where UserName= " + UserName + " ";
        try
        {
            objDB.OpenConnection();
            DataSet ds = objDB.QueryData(sql, "departmentinfo");
            if (ds.Tables.Count > 0)
            {
                long nRow = ds.Tables[0].Rows.Count;
                if (nRow > 0)
                {
                    dataUser = new UserData[nRow];
                    for (int i = 0; i < nRow; i++)
                    {
                        dataUser[i] = new UserData();
                        dataUser[i].PassWord = ds.Tables[0].Rows[i]["PassWord"].ToString();
                        dataUser[i].UserId = ds.Tables[0].Rows[i]["UserId"].ToString();
                        dataUser[i].Remark = ds.Tables[0].Rows[i]["Remark"].ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            //iRel = -1;
            throw new Exception(ex.ToString());
        }
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        return dataUser;
    }

    public DataTable Get()
    {
        DataTable dt = new DataTable();
        CommonDB objDB = new CommonDB();
        string sql = "select * from [User]";
        objDB.OpenConnection();
        dt = objDB.QueryDataTable(sql, "tabname");
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        return dt;
    }
}

