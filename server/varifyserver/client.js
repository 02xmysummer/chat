const grpc = require('@grpc/grpc-js');
const message_proto = require('./proto');

function main() {
    // 创建客户端
    const client = new message_proto.VarifyService(
        'localhost:50051',
        grpc.credentials.createInsecure()
    );

    // 准备请求参数
    const email = 'your-email@example.com'; // 替换为你要发送验证码的邮箱

    // 发送请求
    client.GetVarifyCode({ email: email }, (error, response) => {
        if (error) {
            console.error('Error:', error);
            return;
        }
        console.log('Response:', response);
    });
}

main();