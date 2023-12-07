"use client";
import React from "react";
import Markdown from "react-markdown";
import { useState, useEffect } from "react";
const Page = () => {
  const [content, setContent] = useState("");

  useEffect(() => {
    fetch("README.md")
      .then((res) => res.text())
      .then((text) => setContent(text));
  }, []);

  return (
    <div>
      <Markdown>{content}</Markdown>
    </div>
  );
};

export default Page;
