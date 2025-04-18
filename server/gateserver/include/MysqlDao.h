#pragma once
#include "const.h"
#include "MySqlPool.h"
class MysqlDao
{
public:
    MysqlDao();
    ~MysqlDao();
    int RegUser(const std::string& name, const std::string& email, const std::string& pwd);
    bool CheckEmail(const std::string& name, const std::string& email);
    bool UpdatePwd(const std::string& name, const std::string& newpwd);

private:
    std::unique_ptr<MySqlPool> pool_;
};