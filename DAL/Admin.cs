using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL
{
    public class Admin:MyBase
    {
       
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Type { get; set; }


        public bool Login()
        {
            if (!Connection())
                return false;

            Command = CommandBuilder(@"select id, name, password, type from admin where email=@email and password=@password");
            Command.Parameters.AddWithValue("@email", Email);
            Command.Parameters.AddWithValue("@password", Password);
            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                Id = Convert.ToInt32(Reader["id"]);
                Name = Reader["name"].ToString();
                ////Email = Reader["email"].ToString();
                //Password = Reader["password"].ToString();
                Type = Reader["type"].ToString();
                return true;
            }

            return false;
        }
    }
}
