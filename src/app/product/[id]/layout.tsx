import React from 'react'

type ILayout ={
    children:React.ReactNode
}
export default function ProductLayout({children}:ILayout) {
  return (
    <div>
        <p>this is product section layout</p>
        {children}
        </div>
  )
}
