using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Configuration;


    public class CommonDB : System.Collections.CollectionBase, System.IDisposable
    {

        #region  Variables
        private string strDbType = "SQL";
        private string m_StrCon;
        private string m_ErrorMessage;

        //SQL   定义
        private SqlConnection m_Con;
        private SqlCommand m_Command;    //for insert,update,delete
        private System.Data.SqlClient.SqlCommand m_SelectCommand;  //for select 
        private System.Data.SqlClient.SqlDataReader m_Reader;
        private SqlTransaction m_Transaction;   //for transaction

        //OleDB 定义
        private OleDbConnection m_OleCon;
        private OleDbCommand m_OleCommand;    //for insert,update,delete
        private System.Data.OleDb.OleDbCommand m_OleSelectCommand;  //for select 
        private System.Data.OleDb.OleDbDataReader m_OleReader;
        private OleDbTransaction m_OleTransaction;   //for transaction

        #endregion

        #region  Properties

        public SqlCommand Command
        {
            get
            {
                return this.m_Command;
            }
        }
        public SqlDataReader Reader
        {
            get
            {
                return this.m_Reader;
            }

            set
            {
                this.m_Reader = value;
            }
        }
        public SqlCommand SelectCommand
        {
            get
            {
                if (this.m_SelectCommand == null)
                {
                    this.m_SelectCommand = new SqlCommand();
                }
                return this.m_SelectCommand;
            }
            set
            {
                this.m_SelectCommand = value;
            }
        }
        public SqlTransaction Transaction
        {
            get
            {
                return this.m_Transaction;
            }
        }

        public OleDbCommand OleCommand
        {
            get
            {
                return this.m_OleCommand;
            }
        }
        public OleDbDataReader OleReader
        {
            get
            {
                return this.m_OleReader;
            }

            set
            {
                this.m_OleReader = value;
            }
        }
        public OleDbCommand OleSelectCommand
        {
            get
            {
                if (this.m_OleSelectCommand == null)
                {
                    this.m_OleSelectCommand = new OleDbCommand();
                }
                return this.m_OleSelectCommand;
            }
            set
            {
                this.m_OleSelectCommand = value;
            }
        }
        public OleDbTransaction OleTransaction
        {
            get
            {
                return this.m_OleTransaction;
            }
        }

        public string ErrorMessage
        {
            get
            {
                return this.m_ErrorMessage;
            }
            set
            {
                this.m_ErrorMessage = value;
            }
        }

        #endregion

        #region  Methods
        public CommonDB()
        {
            this.m_StrCon = ConfigurationManager.ConnectionStrings["WSConnectionString"].ConnectionString;
            //strDbType = "SQL";
            //this.m_StrCon = ConfigurationManager.ConnectionStrings["m_StrCon"].ConnectionString;
            //this.m_StrCon = System.Configuration.ConfigurationManager.AppSettings["m_StrCon"];
            // System.Configuration.ConfigurationSettings.AppSettings.Get("ConnectionString");
            //this.m_StrCon = System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"];
            //string path = System.IO.Directory.GetCurrentDirectory();
            //path = path.EndsWith(@"\")?path:path+@"\Data\" + @"Client.dat";
            //this.m_StrCon = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Persist Security Info=True;Jet OLEDB:Database Password=c!i3nt";
        }

        //    '------------------------------------------------------------------------------
        //    '-- Function   : QueryDataTable
        //    '-- Description: This function is used for query data by sql statements,it will
        //    '--              return a datatable object,when call it,judge if the datatable
        //    '--              object is null or not,then datatable.rows.count,then use it
        //    '--              e.g.:  1. strSql = "select * from tableA"
        //    '--                     2. strSql = "exec sp_xx_xx varA,varB,varC"
        //    '-- Input      : strSql  
        //    '--              tabName
        //    '-- Output     : A datatable
        //    '------------------------------------------------------------------------------
        public DataTable QueryDataTable(string strSql, string tabName)
        {
            DataSet tmpDS;
            DataTable tmpTab = null;

            tmpDS = this.QueryData(strSql, tabName);

            if (tmpDS.Tables.Count > 0)
            {
                tmpTab = tmpDS.Tables[0];
            }
            return tmpTab;
        }

        //    '------------------------------------------------------------------------------
        //    '-- Function   : QueryDataTable()
        //    '-- Description: This function is used for query data by Selectcommand,it will
        //    '--              return a datatable object,when call it,judge if the datatable
        //    '--              object is null or not,then datatable.rows.count,then use it
        //    '--              First should set the SelectCommand 
        //    '-- Input      : tabName
        //    '-- Output     : A datatable
        //    '------------------------------------------------------------------------------
        public DataTable QueryDataTable(string tabName)
        {
            DataSet tmpDS;
            DataTable tmpTab = null;

            tmpDS = this.QueryData(tabName);

            if (tmpDS.Tables.Count > 0)
            {
                tmpTab = tmpDS.Tables[0];
            }
            return tmpTab;
        }

        //    '------------------------------------------------------------------------------
        //    '-- Function   : QueryData
        //    '-- Description: This function is used for query data by sql statements,it will
        //    '--              return a dataset anyway.
        //    '--              e.g.:  1. strSql = "select * from tableA"
        //    '--                     2. strSql = "exec sp_xx_xx varA,varB,varC"
        //    '-- Input      : strSql  
        //    '--              tabName
        //    '-- Output     : A dataset
        //    '------------------------------------------------------------------------------
        public DataSet QueryData(string strSql, string tabName)
        {
            DataSet tmpDS;
            if (this.strDbType.ToUpper().Equals("SQL"))
            {
                SqlDataAdapter tmpDA;


                if (tabName.Trim().Length == 0)
                {
                    tabName = "TEMP";
                }

                tmpDS = new DataSet();

                tmpDA = new SqlDataAdapter(strSql, this.m_StrCon);
                tmpDA.MissingSchemaAction = MissingSchemaAction.AddWithKey;

                try
                {
                    tmpDA.Fill(tmpDS, tabName);
                }
                catch (Exception ex)
                {
                    this.m_ErrorMessage = ex.Message;
                }
                finally
                {
                    if (tmpDA != null)
                    {
                        if (tmpDA.SelectCommand != null)
                        {
                            if (tmpDA.SelectCommand.Connection != null)
                            {
                                tmpDA.SelectCommand.Connection.Dispose();
                            }
                            tmpDA.SelectCommand.Dispose();
                        }
                        tmpDA.Dispose();
                        tmpDA = null;
                    }
                }
            }
            else
            {
                OleDbDataAdapter tmpDA;

                if (tabName.Trim().Length == 0)
                {
                    tabName = "TEMP";
                }

                tmpDS = new DataSet();

                tmpDA = new OleDbDataAdapter(strSql, this.m_StrCon);
                tmpDA.MissingSchemaAction = MissingSchemaAction.AddWithKey;

                try
                {
                    tmpDA.Fill(tmpDS, tabName);
                }
                catch (Exception ex)
                {
                    this.m_ErrorMessage = ex.Message;
                }
                finally
                {
                    if (tmpDA != null)
                    {
                        if (tmpDA.SelectCommand != null)
                        {
                            if (tmpDA.SelectCommand.Connection != null)
                            {
                                tmpDA.SelectCommand.Connection.Dispose();
                            }
                            tmpDA.SelectCommand.Dispose();
                        }
                        tmpDA.Dispose();
                        tmpDA = null;
                    }
                }
            } return tmpDS;
        }



        //    '------------------------------------------------------------------------------
        //    '-- Function   : QueryData
        //    '-- Description: This function is used for query data by Selectcommand,it will
        //    '--              return a dataset anyway.
        //    '--              First should set the SelectCommand 
        //    '-- Input      : tabName
        //    '-- Output     : 
        //    '------------------------------------------------------------------------------
        public DataSet QueryData(string tabName)
        {
            DataSet tmpDS;
            if (tabName.Trim().Length == 0)
            {
                tabName = "TEMP";
            }
            tmpDS = new DataSet();

            if (this.strDbType.ToUpper().Equals("SQL"))
            {
                SqlDataAdapter tmpDA;
                SqlConnection tmpCon;

                tmpCon = new SqlConnection(this.m_StrCon);
                this.m_SelectCommand.Connection = tmpCon;
                tmpDA = new SqlDataAdapter(this.m_SelectCommand);

                try
                {
                    tmpDA.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                    tmpDA.Fill(tmpDS, tabName);
                }
                catch (Exception ex)
                {
                    this.m_ErrorMessage = ex.Message;
                }
                finally
                {
                    if (tmpDA != null)
                    {
                        if (tmpDA.SelectCommand != null)
                        {
                            if (tmpDA.SelectCommand.Connection != null)
                            {
                                tmpDA.SelectCommand.Connection.Dispose();
                            }
                            tmpDA.SelectCommand.Dispose();
                        }
                        tmpDA.Dispose();
                        tmpDA = null;

                        tmpCon = null;
                    }
                }
            }
            else
            {
                OleDbDataAdapter tmpDA;
                OleDbConnection tmpCon;
                tmpCon = new OleDbConnection(this.m_StrCon);
                this.m_OleSelectCommand.Connection = tmpCon;
                tmpDA = new OleDbDataAdapter(this.m_OleSelectCommand);

                try
                {
                    tmpDA.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                    tmpDA.Fill(tmpDS, tabName);
                }
                catch (Exception ex)
                {
                    this.m_ErrorMessage = ex.Message;
                }
                finally
                {
                    if (tmpDA != null)
                    {
                        if (tmpDA.SelectCommand != null)
                        {
                            if (tmpDA.SelectCommand.Connection != null)
                            {
                                tmpDA.SelectCommand.Connection.Dispose();
                            }
                            tmpDA.SelectCommand.Dispose();
                        }
                        tmpDA.Dispose();
                        tmpDA = null;

                        tmpCon = null;
                    }
                }
            }

            return tmpDS;
        }

        //    '------------------------------------------------------------------------------
        //    '-- Function   : OpenConnection()  
        //    '-- Description: This function will open a native connection for insert/update
        //    '--              and delete command
        //    '-- Input      : None
        //    '-- Output     : None
        //    '------------------------------------------------------------------------------
        public void OpenConnection()
        {
            if (this.strDbType.ToUpper().Equals("SQL"))
            {
                this.m_Con = new SqlConnection(this.m_StrCon);
                this.m_Con.Open();
                this.m_Command = new SqlCommand();
                this.m_Command.Connection = this.m_Con;
            }
            else
            {
                this.m_OleCon = new OleDbConnection(this.m_StrCon);
                this.m_OleCon.Open();
                this.m_OleCommand = new OleDbCommand();
                this.m_OleCommand.Connection = this.m_OleCon;
            }

        }

        //    '------------------------------------------------------------------------------
        //    '-- Function   : OpenTransactionConnection()  
        //    '-- Description: This function will open a native connection only for transaction
        //    '-- Input      : None
        //    '-- Output     : None
        //    '------------------------------------------------------------------------------
        public void OpenTransactionConnection()
        {
            if (this.strDbType.ToUpper().Equals("SQL"))
            {
                this.m_Con = new SqlConnection(this.m_StrCon);
                this.m_Con.Open();
                this.m_Command = new SqlCommand();
                this.m_Command.Connection = this.m_Con;

                this.m_Transaction = this.m_Con.BeginTransaction(IsolationLevel.Serializable);
                this.m_Command.Transaction = this.m_Transaction;
            }
            else
            {
                this.m_OleCon = new OleDbConnection(this.m_StrCon);
                this.m_OleCon.Open();
                this.m_OleCommand = new OleDbCommand();
                this.m_OleCommand.Connection = this.m_OleCon;

                this.m_OleTransaction = this.m_OleCon.BeginTransaction(IsolationLevel.Serializable);
                this.m_OleCommand.Transaction = this.m_OleTransaction;
            }
        }

        //    '------------------------------------------------------------------------------
        //    '-- Function   : CloseConnection()  
        //    '-- Description: This function will close a open native connection,ensure call
        //    '--              it after OpenConnection() and excute a SqlCommand!!!!!!!!
        //    '-- Input      : None
        //    '-- Output     : None
        //    '------------------------------------------------------------------------------
        public void CloseConnection()
        {
            if (this.strDbType.ToUpper().Equals("SQL"))
            {
                if (this.m_Command != null)
                {
                    this.m_Command.Dispose();
                    this.m_Command = null;
                }

                if (this.m_Con != null)
                {
                    if (this.m_Con.State != ConnectionState.Closed)
                    {
                        this.m_Con.Close();
                    }

                    this.m_Con.Dispose();
                    this.m_Con = null;
                }

                if (this.m_Transaction != null)
                {
                    //this.m_Transaction.Dispose();
                    this.m_Transaction = null;
                }

                if (this.SelectCommand != null)
                {
                    if (this.SelectCommand.Connection != null)
                    {
                        this.SelectCommand.Connection.Dispose();
                    }
                    this.SelectCommand.Dispose();
                }
            }
            else
            {
                if (this.m_OleCommand != null)
                {
                    this.m_OleCommand.Dispose();
                    this.m_OleCommand = null;
                }

                if (this.m_OleCon != null)
                {
                    if (this.m_OleCon.State != ConnectionState.Closed)
                    {
                        this.m_OleCon.Close();
                    }

                    this.m_OleCon.Dispose();
                    this.m_OleCon = null;
                }

                if (this.m_OleTransaction != null)
                {
                    //this.m_Transaction.Dispose();
                    this.m_Transaction = null;
                }

                if (this.SelectCommand != null)
                {
                    if (this.SelectCommand.Connection != null)
                    {
                        this.SelectCommand.Connection.Dispose();
                    }
                    this.SelectCommand.Dispose();
                }
            }
        }

        public void Dispose()
        {
            this.Dispose(true);
            GC.SuppressFinalize(this);
        }

        public void Dispose(bool disposing)
        {
            if (!disposing)
            {
                return;
            }
            this.CloseConnection();
        }
        #endregion

        #region Enum
        public enum Status
        {
            All,
            Active,
            Cancelled
        }
        #endregion
    }



