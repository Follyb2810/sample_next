"use client"
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import React from 'react'

export default function Navigation() {
  const pathName = usePathname();
  return (
    <div>
        <Link href={'/'}  className={ pathName == '/'?'font-bold text-blue-800 mr-4':'mr-4 text-blue-400'}>Home</Link>
        <Link href={'/about'} className={ pathName == '/about'?'font-bold text-blue-800 mr-4':'mr-4 text-blue-400'}>About</Link>
        <Link href={'/product/1'} className={ pathName == '/product'?'font-bold text-blue-800 mr-4':'mr-4 text-blue-400'}>Product</Link>
    </div>
  )
}
