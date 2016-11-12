using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Data.SqlClient;

public class sqlfunc : IDisposable
{

    

    //Public strConn As String = System.Configuration.ConfigurationSettings.AppSettings("connectionString")
    public string strConn = dbConnectionString;
    SqlConnection oConn;

    public SqlCommand cmd;
    public sqlfunc()
    {
        oConn = new SqlConnection(strConn);
        if (oConn.State == ConnectionState.Open)
        {
            oConn.Close();
        }
        oConn.Open();
        cmd = new SqlCommand();
        cmd.Connection = oConn;
        cmd.CommandType = CommandType.StoredProcedure;
           
    }



    public void cmdReset()
    {
        //** Reset command object
        //cmd.Parameters.Clear()
        cmd.CommandText = null;
    }

    public SqlDataReader GetReader()
    {
        //** Executes command (cmd), and return a datareader
        SqlDataReader dr = default(SqlDataReader);
        dr = cmd.ExecuteReader();
        return dr;
    }

    public SqlDataReader GetReader(string sql)
    {
        //** Executes sql statement, and returns a datareader
        SqlDataReader dr = default(SqlDataReader);
        cmd.CommandText = sql;
        dr = cmd.ExecuteReader();
        return dr;
    }

    public bool ExecSql(string sql)
    {
        //** Executes sql statement returns true or false
        try
        {
            cmd.CommandText = sql;
            cmd.ExecuteNonQuery();
            return true;
        }
        catch
        {
            return false;
        }
    }

    public int ExecSqlNewID(string sql)
    {
        //** Executes sql statement and returns new ID
        //Try
        int iout = 0;
        cmd.CommandText = sql;
        cmd.ExecuteNonQuery();
        cmd.CommandText = "SELECT @@IDENTITY";
        iout = Convert.ToInt32(cmd.ExecuteScalar());
        //	Catch
        //Return iout
        //		End Try
        return iout;
    }

    public DataSet GetDataSet(string sql)
    {
        DataSet tDs = new DataSet();
        SqlDataAdapter dCmd = new SqlDataAdapter(sql, oConn);
        dCmd.Fill(tDs);
        dCmd.Dispose();
        return tDs;
    }

    public DataSet GetDataSet(string sql, int startPage, int pageSize)
    {
        DataSet tDs = new DataSet();
        SqlDataAdapter dCmd = new SqlDataAdapter(sql, oConn);
        dCmd.Fill(tDs, startPage, pageSize, "");
        dCmd.Dispose();
        return tDs;
    }

    public void Dispose()
    {
        cmd.Dispose();
        cmd = null;
        oConn.Close();
        oConn.Dispose();
        SqlConnection.ClearPool(oConn);
        oConn = null;
    }
    public static string dbConnectionString
    {
        get { return @"Data Source=HP\SQLEXPRESS;Initial Catalog=DesaiEcom;Connection Timeout=180;User ID=sa;Password=sa@123"; }
    }
}

//=======================================================
//Service provided by Telerik (www.telerik.com)
//Conversion powered by NRefactory.
//Twitter: @telerik
//Facebook: facebook.com/telerik
//=======================================================
