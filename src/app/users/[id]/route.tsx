import { users } from "../route";
export async function GET(_request:Request,{params}:{params:{id:string}}){
    const {id} = await params;
    const singleUser = users.find(u =>u.id == +id);
    return Response.json(singleUser);
}
export async function POST(){}