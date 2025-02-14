"use client"
import { useRouter } from 'next/navigation'
import React from 'react'

export default function Page() {
  const {back,forward,push} = useRouter()
  return (
    <div>
      <p>
        page
        </p>
        <button className='bg-blue-400 text-white rounded-3xl p-2 mx-2' onClick={()=>push('/')}>go home</button>
        <button className='bg-blue-400 text-white rounded-3xl p-2 mx-2' onClick={()=>back()}>go back home</button>
        <button className='bg-blue-400 text-white rounded-3xl p-2 mx-2' onClick={()=>forward()}>go forward home</button>
      </div>
  )
}
