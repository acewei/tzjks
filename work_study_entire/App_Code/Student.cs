using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class StudentData
{
    private string m_SId;
    private string m_Sname;
    private string m_Ssex;
    private string m_Sey;
    private string m_BCname;
    private string m_BCid;
    private string m_Class;
    private string m_Institute;
    private string m_SGid;

    public string SId
    {
        get { return this.m_SId; }
        set { this.m_SId = value; }
    }
    public string Sname
    {
        get { return this.m_Sname; }
        set { this.m_Sname = value; }
    }
    public string Ssex
    {
        get { return this.m_Ssex; }
        set { this.m_Ssex = value; }
    }
    public string Sey
    {
        get { return this.m_Sey; }
        set { this.m_Sey = value; }
    }
    public string BCname
    {
        get { return this.m_BCname; }
        set { this.m_BCname = value; }
    }
    public string BCid
    {
        get { return this.m_BCid; }
        set { this.m_BCid = value; }
    }
    public string Class
    {
        get { return this.m_Class; }
        set { this.m_Class = value; }
    }
    public string Institute
    {
        get { return this.m_Institute; }
        set { this.m_Institute = value; }
    }
    public string SGid
    {
        get { return this.m_SGid; }
        set { this.m_SGid = value; }
    }
}

public class Student
{
    public bool Insert(StudentData dataStudent)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = " insert into Student (SId,Sname,Ssex,Sey,BCname,BCid,Class,Institute,BGid)  values (@SId,@Sname,@Ssex,@Sey,@BCname,@BCid,@Class,@Institute,@BGid) ";
            objDB.Command.CommandType = System.Data.CommandType.Text;
            objDB.Command.CommandText = strSql;
            objDB.Command.Parameters.AddWithValue("@SId", dataStudent.SId);
            objDB.Command.Parameters.AddWithValue("@Sname", dataStudent.Sname);
            objDB.Command.Parameters.AddWithValue("@Ssex", dataStudent.Ssex);
            objDB.Command.Parameters.AddWithValue("@Sey", dataStudent.Sey);
            objDB.Command.Parameters.AddWithValue("@BCname", dataStudent.BCname);
            objDB.Command.Parameters.AddWithValue("@BCid", dataStudent.BCid);
            objDB.Command.Parameters.AddWithValue("@Class", dataStudent.Class);
            objDB.Command.Parameters.AddWithValue("@Institute", dataStudent.Institute);
            objDB.Command.Parameters.AddWithValue("@BGid", dataStudent.SGid);
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
    public bool Modify(StudentData dataStudent)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = "update Student set Sname=@Sname,Ssex=@Ssex,Sey=@Sey,BCname=@BCname,BCid=@BCid,Class=@Class,Institute=@Institute,SGid=@SGid where SId = @SId";
            objDB.Command.CommandType = System.Data.CommandType.Text;
            objDB.Command.CommandText = strSql;
            objDB.Command.Parameters.AddWithValue("@Sname", dataStudent.Sname);
            objDB.Command.Parameters.AddWithValue("@Ssex", dataStudent.Ssex);
            objDB.Command.Parameters.AddWithValue("@Sey", dataStudent.Sey);
            objDB.Command.Parameters.AddWithValue("@BCname", dataStudent.BCname);
            objDB.Command.Parameters.AddWithValue("@BCid", dataStudent.BCid);
            objDB.Command.Parameters.AddWithValue("@Class", dataStudent.Class);
            objDB.Command.Parameters.AddWithValue("@Institute", dataStudent.Institute);
            objDB.Command.Parameters.AddWithValue("@SGid", dataStudent.SGid);
            objDB.Command.Parameters.AddWithValue("@SId", dataStudent.SId);
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

    public bool Delete(string SId)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = "delete from Student where SId=" + SId + "";
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

    public StudentData[] Select(string SId)
    {
      //int iRel = -1;
        CommonDB objDB = new CommonDB();
        StudentData[] dataStudent = new StudentData[1];
        string sql = "select * from Student where SId= " + SId + " ";
        try
        {
            objDB.OpenConnection();
            DataSet ds = objDB.QueryData(sql, "departmentinfo");
            if (ds.Tables.Count > 0)
            {
                long nRow = ds.Tables[0].Rows.Count;
                if (nRow > 0)
                {
                    dataStudent = new StudentData[nRow];
                    for (int i = 0; i < nRow; i++)
                    {
                        dataStudent[i] = new StudentData();
                        dataStudent[i].Sname = ds.Tables[0].Rows[i]["Sname"].ToString();
                        dataStudent[i].Ssex = ds.Tables[0].Rows[i]["Ssex"].ToString();
                        dataStudent[i].Sey = ds.Tables[0].Rows[i]["Sey"].ToString();
                        dataStudent[i].BCname = ds.Tables[0].Rows[i]["BCname"].ToString();
                        dataStudent[i].BCid = ds.Tables[0].Rows[i]["BCid"].ToString();
                        dataStudent[i].Class = ds.Tables[0].Rows[i]["Class"].ToString();
                        dataStudent[i].Institute = ds.Tables[0].Rows[i]["Institute"].ToString();
                        dataStudent[i].SGid = ds.Tables[0].Rows[i]["SGid"].ToString();
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
        return dataStudent;
    }

    public DataTable Get()
    {
        DataTable dt = new DataTable();
        CommonDB objDB = new CommonDB();
        string sql = "select * from Student";
        objDB.OpenConnection();
        dt = objDB.QueryDataTable(sql, "tabname");
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        return dt;
    }
}

