export const users =[
    {id:1,name:'folly'},
    {id:2,name:'babs'},
]
export async function GET(){
    return Response.json(users)
}
export async function POST(request:Request){
    const user =await request.json();
    const newUser= {
        id:users.length +1,
        name:user.name
    };
    users.push(newUser);
    // return Response.json('')
    return new Response(JSON.stringify(newUser),{
        headers:{"Content-Type":"applcation/json"},
        status:201
    })
}