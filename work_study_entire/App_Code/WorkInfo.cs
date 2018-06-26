using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class WorkInfoData
{
    private string m_PostId;
    private string m_Post;
    private string m_WorkPlace;
    private string m_HourlyWage;
    private string m_GenderReq;
    private string m_BelongUnit;
    private string m_GradeReq;
    private string m_LossForAbsence;
    private string m_JobDescription;
    private string m_ApplyTimeBe;
    private string m_ApplyTimeFi;
    private string m_PeoNumberDemand;

    public string PostId
    {
        get { return this.m_PostId; }
        set { this.m_PostId = value; }
    }
    public string Post
    {
        get { return this.m_Post; }
        set { this.m_Post = value; }
    }
    public string WorkPlace
    {
        get { return this.m_WorkPlace; }
        set { this.m_WorkPlace = value; }
    }
    public string HourlyWage
    {
        get { return this.m_HourlyWage; }
        set { this.m_HourlyWage = value; }
    }
    public string GenderReq
    {
        get { return this.m_GenderReq; }
        set { this.m_GenderReq = value; }
    }
    public string BelongUnit
    {
        get { return this.m_BelongUnit; }
        set { this.m_BelongUnit = value; }
    }
    public string GradeReq
    {
        get { return this.m_GradeReq; }
        set { this.m_GradeReq = value; }
    }
    public string LossForAbsence
    {
        get { return this.m_LossForAbsence; }
        set { this.m_LossForAbsence = value; }
    }
    public string JobDescription
    {
        get { return this.m_JobDescription; }
        set { this.m_JobDescription = value; }
    }
    public string ApplyTimeBe
    {
        get { return this.m_ApplyTimeBe; }
        set { this.m_ApplyTimeBe = value; }
    }
    public string ApplyTimeFi
    {
        get { return this.m_ApplyTimeFi; }
        set { this.m_ApplyTimeFi = value; }
    }
    public string PeoNumberDemand
    {
        get { return this.m_PeoNumberDemand; }
        set { this.m_PeoNumberDemand = value; }
    }
}
public class WorkInfo
{
    public bool Insert(WorkInfoData dataWorkInfo)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = " insert into WorkInfo (PostId,Post,WorkPlace,HourlyWage,GenderReq,BelongUnit,GradeReq,LossForAbsence,JobDescription,ApplyTimeBe,ApplyTimeFi,PeoNumberDemand)  values (@PostId,@Post,@WorkPlace,@HourlyWage,@GenderReq,@BelongUnit,@GradeReq,@LossForAbsence,@JobDescription,@ApplyTimeBe,@ApplyTimeFi,@PeoNumberDemand) ";
            objDB.Command.CommandType = System.Data.CommandType.Text;
            objDB.Command.CommandText = strSql;
            objDB.Command.Parameters.AddWithValue("@PostId", dataWorkInfo.Post);
            objDB.Command.Parameters.AddWithValue("@Post", dataWorkInfo.Post);
            objDB.Command.Parameters.AddWithValue("@WorkPlace", dataWorkInfo.WorkPlace);
            objDB.Command.Parameters.AddWithValue("@HourlyWage", dataWorkInfo.HourlyWage);
            objDB.Command.Parameters.AddWithValue("@GenderReq", dataWorkInfo.GenderReq);
            objDB.Command.Parameters.AddWithValue("@BelongUnit", dataWorkInfo.BelongUnit);
            objDB.Command.Parameters.AddWithValue("@GradeReq", dataWorkInfo.GradeReq);
            objDB.Command.Parameters.AddWithValue("@LossForAbsence", dataWorkInfo.LossForAbsence);
            objDB.Command.Parameters.AddWithValue("@JobDescription", dataWorkInfo.JobDescription);
            objDB.Command.Parameters.AddWithValue("@ApplyTimeBe", dataWorkInfo.ApplyTimeBe);
            objDB.Command.Parameters.AddWithValue("@ApplyTimeFi", dataWorkInfo.ApplyTimeFi);
            objDB.Command.Parameters.AddWithValue("@PeoNumberDemand", dataWorkInfo.PeoNumberDemand);
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
    public bool Modify(WorkInfoData dataWorkInfo)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = "update WorkInfo set Post=@Post,WorkPlace=@WorkPlace,HourlyWage=@HourlyWage,GenderReq=@GenderReq,BelongUnit=@BelongUnit,GradeReq=@GradeReq,LossForAbsence=@LossForAbsence,JobDescription=@JobDescription,ApplyTimeBe=@ApplyTimeBe,ApplyTimeFi=@ApplyTimeFi,PeoNumberDemand=@PeoNumberDemand where PostId = @PostId";
            objDB.Command.CommandType = System.Data.CommandType.Text;
            objDB.Command.CommandText = strSql;
            objDB.Command.Parameters.AddWithValue("@Post", dataWorkInfo.Post);
            objDB.Command.Parameters.AddWithValue("@WorkPlace", dataWorkInfo.WorkPlace);
            objDB.Command.Parameters.AddWithValue("@HourlyWage", dataWorkInfo.HourlyWage);
            objDB.Command.Parameters.AddWithValue("@GenderReq", dataWorkInfo.GenderReq);
            objDB.Command.Parameters.AddWithValue("@BelongUnit", dataWorkInfo.BelongUnit);
            objDB.Command.Parameters.AddWithValue("@GradeReq", dataWorkInfo.GradeReq);
            objDB.Command.Parameters.AddWithValue("@LossForAbsence", dataWorkInfo.LossForAbsence);
            objDB.Command.Parameters.AddWithValue("@JobDescription", dataWorkInfo.JobDescription);
            objDB.Command.Parameters.AddWithValue("@ApplyTimeBe", dataWorkInfo.ApplyTimeBe);
            objDB.Command.Parameters.AddWithValue("@ApplyTimeFi", dataWorkInfo.ApplyTimeFi);
            objDB.Command.Parameters.AddWithValue("@PeoNumberDemand", dataWorkInfo.PeoNumberDemand);
            objDB.Command.Parameters.AddWithValue("@PostId", dataWorkInfo.PostId);
            iRel = objDB.Command.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            iRel = -1;
            throw new Exception(ex.ToString());
        }
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        bRel = (iRel.Equals(1) ? true : false); return bRel;
    }

    public bool Delete(string PostId)
    {
        int iRel = -1;
        bool bRel = false;
        CommonDB objDB = new CommonDB();
        try
        {
            objDB.OpenConnection();
            string strSql = "delete from Student where PostId=" + PostId + "";
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

    public WorkInfoData[] Select(string PostId)
    {
        //int iRel = -1;
        CommonDB objDB = new CommonDB();
        WorkInfoData[] dataWorkInfo = new WorkInfoData[1];
        string sql = "select * from WorkInfo where PostId= " + PostId + " ";
        try
        {
            objDB.OpenConnection();
            DataSet ds = objDB.QueryData(sql, "departmentinfo");
            if (ds.Tables.Count > 0)
            {
                long nRow = ds.Tables[0].Rows.Count;
                if (nRow > 0)
                {
                    dataWorkInfo = new WorkInfoData[nRow];
                    for (int i = 0; i < nRow; i++)
                    {
                        dataWorkInfo[i] = new WorkInfoData();
                        dataWorkInfo[i].Post = ds.Tables[0].Rows[i]["Post"].ToString();
                        dataWorkInfo[i].WorkPlace = ds.Tables[0].Rows[i]["WorkPlace"].ToString();
                        dataWorkInfo[i].HourlyWage = ds.Tables[0].Rows[i]["HourlyWage"].ToString();
                        dataWorkInfo[i].GenderReq = ds.Tables[0].Rows[i]["GenderReq"].ToString();
                        dataWorkInfo[i].BelongUnit = ds.Tables[0].Rows[i]["BelongUnit"].ToString();
                        dataWorkInfo[i].GradeReq = ds.Tables[0].Rows[i]["GradeReq"].ToString();
                        dataWorkInfo[i].LossForAbsence = ds.Tables[0].Rows[i]["LossForAbsence"].ToString();
                        dataWorkInfo[i].JobDescription = ds.Tables[0].Rows[i]["JobDescription"].ToString();
                        dataWorkInfo[i].ApplyTimeBe = ds.Tables[0].Rows[i]["ApplyTimeBe"].ToString();
                        dataWorkInfo[i].ApplyTimeFi = ds.Tables[0].Rows[i]["ApplyTimeFi"].ToString();
                        dataWorkInfo[i].PeoNumberDemand = ds.Tables[0].Rows[i]["PeoNumberDemand"].ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            //iRel = -1;
        }
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        return dataWorkInfo;
    }

    public DataTable Get()
    {
        DataTable dt = new DataTable();
        CommonDB objDB = new CommonDB();
        string sql = "select * from WorkInfo";
        objDB.OpenConnection();
        dt = objDB.QueryDataTable(sql, "tabname");
        objDB.CloseConnection();
        objDB.Dispose();
        objDB = null;
        return dt;
    }
}

