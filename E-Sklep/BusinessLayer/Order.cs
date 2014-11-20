using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace E_Sklep.BusinessLayer
{
    public class Order
    {
        public string Dane;
        public string Adres;
        public string Telefon;
        public string Produkty;

        public void AddNewOrder()
        {
            SqlParameter[] parameters = new SqlParameter[4];
            parameters[0] = DataLayer.DataAccess.AddParameter("@Dane", Dane, System.Data.SqlDbType.VarChar, 100);
            parameters[1] = DataLayer.DataAccess.AddParameter("@Adres", Adres, System.Data.SqlDbType.VarChar, 200);
            parameters[2] = DataLayer.DataAccess.AddParameter("@Telefon", Telefon, System.Data.SqlDbType.VarChar, 10);
            parameters[3] = DataLayer.DataAccess.AddParameter("@Produkty", Produkty, System.Data.SqlDbType.VarChar, 300);
          

            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("NoweZamowienie", parameters);
        }

        public DataTable GetZamowienia()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_GetAllZamowienia", parameters);
            return dt;
        }

    }
}