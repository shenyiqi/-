﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyPets.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MyPetsEntities : DbContext
    {
        public MyPetsEntities()
            : base("name=MyPetsEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Adminstrator> Adminstrator { get; set; }
        public virtual DbSet<Baike> Baike { get; set; }
        public virtual DbSet<BaikeActivity> BaikeActivity { get; set; }
        public virtual DbSet<BaikeAnswer> BaikeAnswer { get; set; }
        public virtual DbSet<BaikeQuestion> BaikeQuestion { get; set; }
        public virtual DbSet<Collect> Collect { get; set; }
        public virtual DbSet<Goods> Goods { get; set; }
        public virtual DbSet<GoodsComment> GoodsComment { get; set; }
        public virtual DbSet<GoodsResponseComment> GoodsResponseComment { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<OrderDetail> OrderDetail { get; set; }
        public virtual DbSet<Post> Post { get; set; }
        public virtual DbSet<PrivateMsg> PrivateMsg { get; set; }
        public virtual DbSet<ResponAnswer> ResponAnswer { get; set; }
        public virtual DbSet<Response> Response { get; set; }
        public virtual DbSet<Shop> Shop { get; set; }
        public virtual DbSet<ShopCart> ShopCart { get; set; }
        public virtual DbSet<ShopRecommend> ShopRecommend { get; set; }
        public virtual DbSet<UserInfo> UserInfo { get; set; }
    }
}
