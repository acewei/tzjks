using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


public class EmployerData
{
    private string m_EmployerId;
    private string m_EmployerName;
    private string m_EmployerSite;

    public string EmployerId
    {
        get { return this.m_EmployerId; }
        set { this.m_EmployerId = value; }
    }
    public string EmployerName
    {
        get { return this.m_EmployerName; }
        set { this.m_EmployerName = value; }
    }
    public string EmployerSite
    {
        get { return this.m_EmployerSite; }
        set { this.m_EmployerSite = value; }
    }
}

public class Employer
{
    public bool Insert(EmployerData dataEmployer)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = " insert into Employer (EmployerId，EmployerName,EmployerSite)  values (@EmployerId，@EmployerName,@EmployerSite) ";
            objDB.Command.CommandType = System.Data.CommandType.Text;
            objDB.Command.CommandText = strSql;
            objDB.Command.Parameters.AddWithValue("@EmployerId", dataEmployer.EmployerId);
            objDB.Command.Parameters.AddWithValue("@EmployerName", dataEmployer.EmployerName);
            objDB.Command.Parameters.AddWithValue("@EmployerSite", dataEmployer.EmployerSite);
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
    public bool Modify(EmployerData dataEmployer)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = "update agreement set EmployerName=@EmployerName,EmployerSite=@EmployerSite where EmployerId = @EmployerId";
            objDB.Command.CommandType = System.Data.CommandType.Text;
            objDB.Command.CommandText = strSql;
            objDB.Command.Parameters.AddWithValue("@EmployerName", dataEmployer.EmployerName);
            objDB.Command.Parameters.AddWithValue("@EmployerSite", dataEmployer.EmployerSite);
            objDB.Command.Parameters.AddWithValue("@EmployerId", dataEmployer.EmployerId);
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

    public bool Delete(string EmployerId)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = "delete from Employer where EmployerId=" + EmployerId + "";
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

    public EmployerData[] Select(string EmployerId)
    {
        //int iRel = -1;
        CommonDB objDB = new CommonDB();
        EmployerData[] dataEmployer = new EmployerData[1];
        string sql = "select * from Employer where EmployerId= " + EmployerId + " ";
        try
        {
            objDB.OpenConnection();
            DataSet ds = objDB.QueryData(sql, "departmentinfo");
            if (ds.Tables.Count > 0)
            {
                long nRow = ds.Tables[0].Rows.Count;
                if (nRow > 0)
                {
                    dataEmployer = new EmployerData[nRow];
                    for (int i = 0; i < nRow; i++)
                    {
                        dataEmployer[i] = new EmployerData();
                        dataEmployer[i].EmployerName = ds.Tables[0].Rows[i]["EmployerName"].ToString();
                        dataEmployer[i].EmployerSite = ds.Tables[0].Rows[i]["EmployerSite"].ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
            //iRel = -1;
        }
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        return dataEmployer;
    }

    public DataTable Get()
    {
        DataTable dt = new DataTable();
        CommonDB objDB = new CommonDB();
        string sql = "select * from Employer";
        objDB.OpenConnection();
        dt = objDB.QueryDataTable(sql, "tabname");
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        return dt;
    }
}

