"use client";

import React, { useEffect, useState } from "react";

type IUser = {
  id: number;
  name: string;
  email: string;
  username: string;
  phone: string;
};

export default function Page() {
  const [users, setUsers] = useState<IUser[]>([]);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [isError, setError] = useState<string | null>(null);

  useEffect(() => {
    async function fetchUser() {
      setIsLoading(true);
      try {
        const res = await fetch("https://jsonplaceholder.typicode.com/users");
        if (!res.ok) {
          throw new Error(`HTTP error! Status: ${res.status}`);
        }
        const data = await res.json();
        setUsers(data);
      } catch (err: unknown) {
        if (err instanceof Error) {
          setError(`Failed to fetch: ${err.message}`);
        }
      } finally {
        setIsLoading(false);
      }
    }
    fetchUser();
    
    return ()=>{}
  }, []);

  return (
    <div>
      {isLoading && <p>Loading...</p>}
      {isError && <p className="text-red-500">{isError}</p>}
      <ul className="space-y-4 p-4">
        {users.map((user) => (
          <li key={user.id} className="bg-yellow-200 rounded-lg text-blue-400  p-2 shadow-md">
            {user.name} ({user.email})
          </li>
        ))}
      </ul>
    </div>
  );
}
