import React from 'react'

type IUser = {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
};
export default async function UserServer() {
  await new Promise((resolve)=> setTimeout(resolve,2000))
  const res = await fetch("https://jsonplaceholder.typicode.com/users");
  const users =await res.json();
  return (
    <div>
        <ul className="space-y-4 p-4">
        {users.map((user : IUser) => (
          <li key={user.id} className="bg-yellow-200 rounded-lg text-blue-400  p-2 shadow-md">
            {user.name} ({user.email})
          </li>
        ))}
      </ul>
    </div>
  )
}
// import React from "react";

// type IUser = {
//   id: number;
//   name: string;
//   email: string;
//   username: string;
//   phone: string;
// };

// export default async function UserServer() {
//   try {
//     const res = await fetch("https://jsonplaceholder.typicode.com/users");

//     if (!res.ok) {
//       throw new Error(`Failed to fetch users: ${res.statusText}`);
//     }

//     const users: IUser[] = await res.json();

//     return (
//       <div>
//         <ul className="space-y-4 p-4">
//           {users.map((user) => (
//             <li
//               key={user.id}
//               className="bg-yellow-200 rounded-lg text-blue-400 p-2 shadow-md"
//             >
//               {user.name} ({user.email})
//             </li>
//           ))}
//         </ul>
//       </div>
//     );
//   } catch (error) {
//     return (
//       <div className="text-red-500 text-center p-4">
//         <p>❌ Failed to load users. Please try again later.</p>
//       </div>
//     );
//   }
// }
// import React, { Suspense } from "react";
// import UserServer from "./UserServer";

// export default function UsersPage() {
//   return (
//     <div>
//       <h1 className="text-xl font-bold mb-4">Users List</h1>

//       <Suspense fallback={<p className="text-gray-500">Loading users...</p>}>
//         <UserServer />
//       </Suspense>
//     </div>
//   );
// }


