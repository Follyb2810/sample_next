"use client"
import React, { useEffect } from 'react'

export default function Error({error}:{error:Error}) {
    useEffect(()=>{
        console.log(error)
    },[error])
  return (
    <div className="flex items-center justify-center h-screen">
        <div className="text-red-300 text-2xl">Error in fetching user</div>
    </div>
  )
}
